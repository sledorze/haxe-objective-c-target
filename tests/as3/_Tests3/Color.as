package _Tests3 {
	public final class Color extends enum {
		public static const __isenum : Boolean = true;
		public function Color( t : String, index : int, p : Array = null ) : void { this.tag = t; this.index = index; this.params = p; }
		public static var Blue : Color = new Color("Blue",2);
		public static var Green : Color = new Color("Green",1);
		public static var Red : Color = new Color("Red",0);
		public static var __constructs__ : Array = ["Red","Green","Blue"];;
	}
}
