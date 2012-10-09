// File generated with the new Haxe objective-c target.
//
#import objc.ios.UIWebView
#import haxe.Log
	public class Test {
		public (NSNumber) setWidthv:(NSNumber*)v{
			return [NSNumber numberWithInt:0];
		}
		
		public (NSNumber) getWidth{
			return [NSNumber numberWithInt:0];
		}
		
		protected (NSNumber) functionHeaderWithParamsc:(BOOL*)c abc:(NSNumber*)abc def:(NSNumber*)def ghi:(NSString*)ghi{
			return ((c)?[NSNumber numberWithInt:1]:[NSNumber numberWithInt:0]);
		}
		
		public function get width() : NSNumber { return getWidth(); }
		public function set width( __v : NSNumber ) : void { setWidth(__v); }
		protected var $width : NSNumber;
		public var float1 : NSNumber;
		static public (void) main{
			haxe.Log._trace(@"Hello world from haxe sources",{ fileName : @"Test.hx", lineNumber : [NSNumber numberWithInt:9], className : @"Test", methodName : @"main"});
			var a : NSMutableArray = new NSMutableArray();
			var aa : NSMutableArray = [[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5]];
			var b : NSNumber = [NSNumber numberWithInt:5];
			var c : NSNumber = 5.0;
			var d : NSString = @"abcdefghijkl";
			var e : BOOL = YES;
			var f : NSNumber;
			var webView : objc.ios.UIWebView = new objc.ios.UIWebView();
			webView.initWithFrame();
			{
				var _g : NSNumber = [NSNumber numberWithInt:0];
				while(_g < aa.length) {
					var i : NSNumber = aa[_g];
					++_g;
					a.push(Std.string(i));
				}
			}
		}
		
	}
}
