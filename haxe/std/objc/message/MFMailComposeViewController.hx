package objc.message;


enum MFMailComposeResult {
    MFMailComposeResultCancelled;
    MFMailComposeResultSaved;
    MFMailComposeResultSent;
    MFMailComposeResultFailed;
}


//extern NSString *const MFMailComposeErrorDomain __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);


enum MFMailComposeErrorCode {
    MFMailComposeErrorCodeSaveFailed;
    MFMailComposeErrorCodeSendFailed;
}


extern interface MFMailComposeViewControllerDelegate {
	public function mailComposeController (controller:MFMailComposeViewController, didFinishWithResult:MFMailComposeResult, error:NSError) :Void;
}


extern class MFMailComposeViewController extends UINavigationController {

	public static function canSendMail :Bool;

	public var mailComposeDelegate :MFMailComposeViewControllerDelegate;

	public function setSubject (subject:NSString) :Void;
	public function setToRecipients (toRecipients:NSArray) :Void;
	public function setCcRecipients (ccRecipients:NSArray) :Void;
	public function setBccRecipients (bccRecipients:NSArray) :Void;
	public function setMessageBody (body:String, isHTML:Bool ) :Void;
	public function addAttachmentData (attachment:NSData, mimeType:String, fileName:String) :Void;

}
