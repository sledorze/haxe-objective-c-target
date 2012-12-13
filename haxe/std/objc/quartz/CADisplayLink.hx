package objc.quartz;

extern class CADisplayLink extends NSObject {

+ (CADisplayLink *)displayLinkWithTarget:(id)target selector:(SEL)sel;


- (void)addToRunLoop:(NSRunLoop *)runloop forMode:(NSString *)mode;

- (void)removeFromRunLoop:(NSRunLoop *)runloop forMode:(NSString *)mode;

- (void)invalidate;


	public var (readonly, nonatomic) CFTimeInterval timestamp, duration;

	public var (getter=isPaused, nonatomic) BOOL paused;

	public var  NSInteger frameInterval;

}
