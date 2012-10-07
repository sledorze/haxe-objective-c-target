extern class UIResponder {
	
	// Managing the Responder Chain
	– nextResponder
	– isFirstResponder
	– canBecomeFirstResponder
	– becomeFirstResponder
	– canResignFirstResponder
	– resignFirstResponder
	
	// Managing Input Views
	  inputView  property
	  inputAccessoryView  property
	– reloadInputViews
	
	// Responding to Touch Events
	– touchesBegan:withEvent:
	– touchesMoved:withEvent:
	– touchesEnded:withEvent:
	– touchesCancelled:withEvent:
	
	// Responding to Motion Events
	– motionBegan:withEvent:
	– motionEnded:withEvent:
	– motionCancelled:withEvent:
	
	// Responding to Remote-Control Events
	– remoteControlReceivedWithEvent:
	
	// Getting the Undo Manager
	  undoManager  property
	
	// Validating Commands
	– canPerformAction:withSender:
}
