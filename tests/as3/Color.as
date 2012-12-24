package  {
	public final class Color extends enum {
		public static const __isenum : Boolean = true;
		public function Color( t : String, index : int, p : Array = null ) : void { this.tag = t; this.index = index; this.params = p; }
		public static function Alpha(a : int, col : Color) : Color { return new Color("Alpha",5,[a,col]); }
		public static var Blue : Color = new Color("Blue",2);
		public static var Green : Color = new Color("Green",1);
		public static function Grey(v : int) : Color { return new Color("Grey",3,[v]); }
		public static var Red : Color = new Color("Red",0);
		public static function Rgb(r : int, g : int, b : int) : Color { return new Color("Rgb",4,[r,g,b]); }
		public static var __constructs__ : Array = ["Red","Green","Blue","Grey","Rgb","Alpha"];;
	}
}
