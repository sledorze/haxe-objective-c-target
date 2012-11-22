package objc.ios.ui;


/*typedef NS_ENUM(NSInteger, UIAlertViewStyle) {
    UIAlertViewStyleDefault = 0,
    UIAlertViewStyleSecureTextInput,
    UIAlertViewStylePlainTextInput,
    UIAlertViewStyleLoginAndPasswordInput
};*/

extern class UIAlertView extends UIView {

	public function initWithTitle (title:String, message:String, delegate:UIAlertViewDelegate, cancelButtonTitle:String, otherButtonTitles:String) :UIAlertView;

	public var delegate :UIAlertViewDelegate;
	public var title :String;
	public var message :String;

	public function addButtonWithTitle (title:String) :Int;
	public function buttonTitleAtIndex (buttonIndex:Int) :String;
	public var numberOfButtons (default, null) :Int;
	public var cancelButtonIndex :Int;

	public var firstOtherButtonIndex (default, null) :Int;
	public var visible (default, null) :Bool;

	public function show () :Void;
	public function dismissWithClickedButtonIndex (buttonIndex:Int, animated:Bool) :Void;

	#if ios_5_0
	public var alertViewStyle :UIAlertViewStyle;
	public function textFieldAtIndex (textFieldIndex:Int) :UITextField;
	#end
}

extern interface UIAlertViewDelegate {
	//@optional
/*	public function alertView (alertView:UIAlertView, clickedButtonAtIndex:Int) :Void;
	public function alertViewCancel (alertView:UIAlertView) :Void;
	public function willPresentAlertView (alertView:UIAlertView) :Void;
	public function didPresentAlertView (alertView:UIAlertView) :Void;
	public function alertView (alertView:UIAlertView, willDismissWithButtonIndex:Int) :Void;
	public function alertView (alertView:UIAlertView, didDismissWithButtonIndex:Int) :Void;
	public function alertViewShouldEnableFirstOtherButton (alertView:UIAlertView) :Bool;*/

}
