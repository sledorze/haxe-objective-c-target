package  {
	public final class TestsEnum extends enum {
		public static const __isenum : Boolean = true;
		public function TestsEnum( t : String, index : int, p : Array = null ) : void { this.tag = t; this.index = index; this.params = p; }
		public static var EnumValue1 : TestsEnum = new TestsEnum("EnumValue1",0);
		public static var EnumValue2 : TestsEnum = new TestsEnum("EnumValue2",1);
		public static var EnumValue3 : TestsEnum = new TestsEnum("EnumValue3",2);
		public static var __constructs__ : Array = ["EnumValue1","EnumValue2","EnumValue3"];;
	}
}
