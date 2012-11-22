package objc.quartz;

extern interface CAMediaTiming {

	public var beginTime :CFTimeInterval;
	public var duration :CFTimeInterval;
	public var speed :Float;
	public var timeOffset :CFTimeInterval;
	public var repeatCount :Float;
	public var repeatDuration :CFTimeInterval;
	public var autoreverses :Bool;
	public var fillMode :String;

}


/*CA_EXTERN NSString * const kCAFillModeForwards
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAFillModeBackwards
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAFillModeBoth
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAFillModeRemoved
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);

}
*/