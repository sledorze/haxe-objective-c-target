package  {
	public final class Color2 extends enum {
		public static const __isenum : Boolean = true;
		public function Color2( t : String, index : int, p : Array = null ) : void { this.tag = t; this.index = index; this.params = p; }
		public static var Blue2 : Color2 = new Color2("Blue2",2);
		public static var Green2 : Color2 = new Color2("Green2",1);
		public static var Red2 : Color2 = new Color2("Red2",0);
		public static var __constructs__ : Array = ["Red2","Green2","Blue2"];;
	}
}
