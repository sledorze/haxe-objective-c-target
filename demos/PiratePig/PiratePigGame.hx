import ios.ui.UIResponder;
import ios.ui.UIImageView;
import ios.ui.UIImage;
import ios.ui.UILabel;
import ios.ui.UIWindow;
import ios.ui.UIScreen;
import ios.ui.UIView;
import ios.ui.UIButton;
import ios.ui.UIControl;
import ios.ui.UIViewController;
import ios.ui.UIApplication;
import ios.ui.UIColor;
import ios.ui.UIFont;
import ios.ui.NSText;
import ios.ui.UIEvent;
import objc.foundation.NSDictionary;
import objc.foundation.NSSet;
import objc.graphics.CGGeometry;

class PiratePigGame extends UIView {
	
	
	private static var NUM_COLUMNS:Int = 8;
	private static var NUM_ROWS:Int = 8;
	
	private static var tileImages:Array <String> = ["game_bear.png", "game_bunny_02.png", "game_carrot.png", "game_lemon.png", "game_panda.png", "game_piratePig.png" ];
	
	private var Background :UIView;
/*	private var introSound :Sound;*/
	private var Logo :UIImageView;
	private var Score :UILabel;
/*	private var Sound3:Sound;
	private var Sound4:Sound;
	private var Sound5:Sound;*/
	private var TileContainer :UIView;
	
	public var currentScale :Float;
	public var currentScore :Int;
	
	private var cacheMouse :CGPoint;
	private var needToCheckMatches :Bool;
	private var selectedTile :Tile;
	private var tiles :Array <Array <Tile>>;
	private var usedTiles :Array <Tile>;
	
	
	public function new () {
		
		super ();
		
		initialize ();
		construct ();
		
		newGame ();
		
	}
	
	
	private function addTile (row:Int, column:Int, animate:Bool = true):Void {
		
		var tile = null;
		var type = Math.round (Math.random () * (tileImages.length - 1));
		
		for (usedTile in usedTiles) {
			if (usedTile.removed && usedTile.superview == null && usedTile.type == type) {
				tile = usedTile;
			}
		}
		
		if (tile == null) {
			tile = new Tile (tileImages[type]);
		}
		
		tile.initialize ();
		
		tile.type = type;
		tile.row = row;
		tile.column = column;
		tiles[row][column] = tile;
		
		var position = getPosition (row, column);
		
		if (animate) {
			
			var firstPosition = getPosition (-1, column);
			
			tile.alpha = 0;
			
			var rect:CGRect = tile.frame;
			rect.origin.x = firstPosition.x;
			rect.origin.y = firstPosition.y;
			tile.frame = rect;
			
			tile.moveTo (0.15 * (row + 1), position.x, position.y);
			#if !js
			//Actuate.tween (tile, 0.3, { alpha: 1 } ).delay (0.15 * (row - 2)).ease (Quad.easeOut);
			#end
			
		} else {
			
			//tile.x = position.x;
			//tile.y = position.y;
			var rect:CGRect = tile.frame;
			rect.origin.x = position.x;
			rect.origin.y = position.y;
			tile.frame = rect;
			
		}
		
		TileContainer.addSubview ( tile );
		needToCheckMatches = true;
		
	}
	
	
	private function construct ():Void {
		
		//Logo.smoothing = true;
		addSubview (Logo);
		
/*		var font = Assets.getFont ("fonts/FreebooterUpdated.ttf");
		var defaultFormat = new TextFormat (font.fontName, 60, 0x000000);
		defaultFormat.align = TextFormatAlign.RIGHT;*/
		
/*		#if js
		// Right-aligned text is not supported in HTML5 yet
		defaultFormat.align = TextFormatAlign.LEFT;
		#end*/
		
		var contentWidth = 75 * NUM_COLUMNS;
		
		var rect:CGRect = Score.frame;
		rect.origin.x = contentWidth - 200;
		rect.origin.y = 12;
		rect.size.width = 200;
		Score.frame = rect;
		
		
/*		#if !js
		Score.filters = [ new BlurFilter (1.5, 1.5), new DropShadowFilter (1, 45, 0, 0.2, 5, 5) ];
		#else
		Score.y = 0;
		Score.x += 90;
		#end*/
		
		addSubview (Score);
		
		//Background.y = 85;
		//Background.graphics.beginFill (0xFFFFFF, 0.4);
		//Background.graphics.drawRect (0, 0, contentWidth, 75 * NUM_ROWS);
		
/*		#if !js
		Background.filters = [ new BlurFilter (10, 10) ];
		addChild (Background);
		#end*/
		addSubview (Background);
		
		var rect:CGRect = TileContainer.frame;
		rect.origin.x = 14;
		rect.origin.y = 85 + 14;
		TileContainer.frame = rect;
		//TileContainer.addEventListener (MouseEvent.MOUSE_DOWN, TileContainer_onMouseDown);
		//Lib.current.stage.addEventListener (MouseEvent.MOUSE_UP, stage_onMouseUp);
		addSubview (TileContainer);
		
/*		IntroSound = Assets.getSound ("soundTheme");
		Sound3 = Assets.getSound ("sound3");
		Sound4 = Assets.getSound ("sound4");
		Sound5 = Assets.getSound ("sound5");*/
		
	}
	
	
	private function dropTiles ():Void {
		
		for (column in 0...NUM_COLUMNS) {
			
			var spaces = 0;
			
			for (row in 0...NUM_ROWS) {
				
				var index = (NUM_ROWS - 1) - row;
				var tile = tiles[index][column];
				
				if (tile == null) {
					spaces++;
				} else {
					if (spaces > 0) {
						
						var position = getPosition (index + spaces, column);
						tile.moveTo (0.15 * spaces, position.x,position.y);
						
						tile.row = index + spaces;
						tiles[index + spaces][column] = tile;
						tiles[index][column] = null;
						
						needToCheckMatches = true;
					}
				}
			}
			
			for (i in 0...spaces) {
				var row = (spaces - 1) - i;
				addTile (row, column);
			}
		}
	}
	
	
	private function findMatches (byRow:Bool, accumulateScore:Bool = true):Array <Tile> {
		
		var matchedTiles = new Array <Tile> ();
		
		var max:Int;
		var secondMax:Int;
		
		if (byRow) {
			max = NUM_ROWS;
			secondMax = NUM_COLUMNS;
		} else {
			max = NUM_COLUMNS;
			secondMax = NUM_ROWS;
		}
		
		for (index in 0...max) {
			
			var matches = 0;
			var foundTiles = new Array <Tile> ();
			var previousType = -1;
			
			for (secondIndex in 0...secondMax) {
				
				var tile:Tile;
				
				if (byRow) {
					tile = tiles[index][secondIndex];
				} else {
					tile = tiles[secondIndex][index];
				}
				
				if (tile != null && !tile.moving) {
					
					if (previousType == -1) {
						
						previousType = tile.type;
						foundTiles.push (tile);
						continue;
						
					} else if (tile.type == previousType) {
						
						foundTiles.push (tile);
						matches++;
						
					}
					
				}
				
				if (tile == null || tile.moving || tile.type != previousType || secondIndex == secondMax - 1) {
					
					if (matches >= 2 && previousType != -1) {
						
						if (accumulateScore) {
							
/*							if (matches > 3) {
								Sound5.play ();
							} else if (matches > 2) {
								Sound4.play ();
							} else {
								Sound3.play ();
							}*/
							
							currentScore += Std.int (Math.pow (matches, 2) * 50);
						}
						
						matchedTiles = matchedTiles.concat (foundTiles);
					}
					
					matches = 0;
					foundTiles = new Array <Tile> ();
					
					if (tile == null || tile.moving) {
						needToCheckMatches = true;
						previousType = -1;
					} else {
						previousType = tile.type;
						foundTiles.push (tile);
					}
				}
			}
		}
		return matchedTiles;
	}
	
	
	private function getPosition (row:Int, column:Int) :CGPoint {
		return CGGeometry.CGPointMake (column * (57 + 16), row * (57 + 16));
	}
	
	
	private function initialize ():Void {
		
		currentScale = 1;
		currentScore = 0;
		
		tiles = new Array <Array <Tile>> ();
		usedTiles = new Array <Tile> ();
		
		for (row in 0...NUM_ROWS) {
			
			tiles[row] = new Array <Tile> ();
			
			for (column in 0...NUM_COLUMNS) {
				tiles[row][column] = null;
			}
		}
		
		Background = new UIView();
		Logo = new UIImageView().initWithImage ( UIImage.imageNamed("logo.png") );
		Score = new UILabel();
		Score.frame = new CGRect (0, 0, 100, 50);
		Score.textColor = UIColor.yellowColor();
		Score.backgroundColor = UIColor.clearColor();
		Score.textAlignment = NSTextAlignmentLeft;
		Score.font = UIFont.boldSystemFontOfSize(30);
		
		TileContainer = new UIView();
		
	}
	
	
	public function newGame ():Void {
		
		currentScore = 0;
		Score.text = "0";
		
		for (row in 0...NUM_ROWS) {
			for (column in 0...NUM_COLUMNS) {
				removeTile (row, column, false);
			}
		}
		
		for (row in 0...NUM_ROWS) {
			for (column in 0...NUM_COLUMNS) {
				addTile (row, column, false);
			}
		}
		
/*		IntroSound.play ();
		removeEventListener (Event.ENTER_FRAME, this_onEnterFrame);
		addEventListener (Event.ENTER_FRAME, this_onEnterFrame);*/
		
	}
	
	
	public function removeTile (row:Int, column:Int, animate:Bool = true):Void {
		
		var tile = tiles[row][column];
		
		if (tile != null) {
			
			tile.remove (animate);
			usedTiles.push (tile);
			
		}
		
		tiles[row][column] = null;
		
	}
	
	
	public function resize (newWidth:Int, newHeight:Int):Void {
		
		var maxWidth = newWidth * 0.90;
		var maxHeight = newHeight * 0.86;
		
		currentScale = 1;
		//scaleX = 1;
		//scaleY = 1;
		
		#if js
		
		// looking up the total width and height is not working, so we'll calculate it ourselves
		
		var currentWidth = 75 * NUM_COLUMNS;
		var currentHeight = 75 * NUM_ROWS + 85;
		
		#else
		
		var currentWidth = this.frame.size.width;
		var currentHeight = this.frame.size.height;
		
		#end
		
		if (currentWidth > maxWidth || currentHeight > maxHeight) {
			
			var maxScaleX = maxWidth / currentWidth;
			var maxScaleY = maxHeight / currentHeight;
			
			if (maxScaleX < maxScaleY) {
				currentScale = maxScaleX;
			} else {
				currentScale = maxScaleY;
			}
			
			//scaleX = currentScale;
			//scaleY = currentScale;
		}
		
		var rect:CGRect = this.frame;
		rect.origin.x = newWidth / 2 - (currentWidth * currentScale) / 2;
		this.frame = rect;
	}
	
	
	private function swapTile (tile:Tile, targetRow:Int, targetColumn:Int):Void {
		
		if (targetColumn >= 0 && targetColumn < NUM_COLUMNS && targetRow >= 0 && targetRow < NUM_ROWS) {
			
			var targetTile = tiles[targetRow][targetColumn];
			
			if (targetTile != null && !targetTile.moving) {
				
				tiles[targetRow][targetColumn] = tile;
				tiles[tile.row][tile.column] = targetTile;
				
				if (findMatches (true, false).length > 0 || findMatches (false, false).length > 0) {
					
					targetTile.row = tile.row;
					targetTile.column = tile.column;
					tile.row = targetRow;
					tile.column = targetColumn;
					var targetTilePosition = getPosition (targetTile.row, targetTile.column);
					var tilePosition = getPosition (tile.row, tile.column);
					
					targetTile.moveTo (0.3, targetTilePosition.x, targetTilePosition.y);
					tile.moveTo (0.3, tilePosition.x, tilePosition.y);
					
					needToCheckMatches = true;
					
				} else {
					
					tiles[targetRow][targetColumn] = targetTile;
					tiles[tile.row][tile.column] = tile;
				}
			}
		}
	}
	
	
	
	
	// Event Handlers
	
	
	override public function touchesBegan (touches:NSSet, withEvent:UIEvent) :Void {
	
	}
	override public function touchesMoved (touches:NSSet, withEvent:UIEvent) :Void {
	
	}
	override public function touchesEnded (touches:NSSet, withEvent:UIEvent) :Void {
	
	}
	override public function touchesCancelled (touches:NSSet, withEvent:UIEvent) :Void {
	
	}
	/*
	private function stage_onMouseUp (event:MouseEvent):Void {
		
		if (cacheMouse != null && selectedTile != null && !selectedTile.moving) {
			
			var differenceX = event.stageX - cacheMouse.x;
			var differenceY = event.stageY - cacheMouse.y;
			
			if (Math.abs (differenceX) > 10 || Math.abs (differenceY) > 10) {
				
				var swapToRow = selectedTile.row;
				var swapToColumn = selectedTile.column;
				
				if (Math.abs (differenceX) > Math.abs (differenceY)) {
					
					if (differenceX < 0) {
						
						swapToColumn --;
						
					} else {
						
						swapToColumn ++;
						
					}
					
				} else {
					
					if (differenceY < 0) {
						
						swapToRow --;
						
					} else {
						
						swapToRow ++;
						
					}
					
				}
				
				swapTile (selectedTile, swapToRow, swapToColumn);
				
			}
			
		}
		
		selectedTile = null;
		cacheMouse = null;
		
	}
	
	
	private function this_onEnterFrame (event:Event):Void {
		
		if (needToCheckMatches) {
			
			var matchedTiles = new Array <Tile> ();
			
			matchedTiles = matchedTiles.concat (findMatches (true));
			matchedTiles = matchedTiles.concat (findMatches (false));
			
			for (tile in matchedTiles) {
				
				removeTile (tile.row, tile.column);
				
			}
			
			if (matchedTiles.length > 0) {
				
				Score.text = Std.string (currentScore);
				dropTiles ();
				
			}
			
		}
		
	}
	
	
	private function TileContainer_onMouseDown (event:MouseEvent):Void {
		
		if (Std.is (event.target, Tile)) {
			
			selectedTile = cast event.target;
			cacheMouse = new Point (event.stageX, event.stageY);
			
		} else {
			
			cacheMouse = null;
			selectedTile = null;
			
		}
		
	}
	*/
	
}