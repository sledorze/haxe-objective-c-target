package  {
	import flash.Boot;
	public class Tests2 {
		public function Tests2() : void { if( !flash.Boot.skip_constructor ) {
			var arr : Array = [this.d1,this.d1,50];
		}}
		
		protected var d1 : int = 34;
	}
}
