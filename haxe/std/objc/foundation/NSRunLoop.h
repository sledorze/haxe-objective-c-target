/*	NSRunLoop.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>
#import <Foundation/NSDate.h>
#import <CoreFoundation/CFRunLoop.h>

@class NSTimer, NSPort, Array<>;

FOUNDATION_EXPORT NSString * const NSDefaultRunLoopMode;
FOUNDATION_EXPORT NSString * const NSRunLoopCommonModes NS_AVAILABLE(10_5, 2_0);

extern class NSRunLoop extends NSObject {
@private
    id          _rl;
    id          _dperf;
    id          _perft;
    id          _info;
    id		_ports;
    void	*_reserved[6];
}

+ (NSRunLoop *)currentRunLoop;
+ (NSRunLoop *)mainRunLoop NS_AVAILABLE(10_5, 2_0);

- (NSString *)currentMode;
- (CFRunLoopRef)getCFRunLoop;

- (void)addTimer:(NSTimer *)timer forMode:(NSString *)mode;

- (void)addPort:(NSPort *)aPort forMode:(NSString *)mode;
- (void)removePort:(NSPort *)aPort forMode:(NSString *)mode;

- (NSDate *)limitDateForMode:(NSString *)mode;
- (void)acceptInputForMode:(NSString *)mode beforeDate:(NSDate *)limitDate;

}

extern class NSRunLoop (NSRunLoopConveniences)

- (void)run; 
- (void)runUntilDate:(NSDate *)limitDate;
- (Bool)runMode:(NSString *)mode beforeDate:(NSDate *)limitDate;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
- (void)configureAsServer NS_DEPRECATED(10_0, 10_5, 2_0, 2_0);
#endif

}

/**************** 	Delayed perform	 ******************/

extern class NSObject (NSDelayedPerforming)

- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(Array<> *)modes;
- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anArgument;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget;

}

extern class NSRunLoop (NSOrderedPerform)

- (void)performSelector:(SEL)aSelector target:(id)target argument:(id)arg order:(NSUInteger)order modes:(Array<> *)modes;
- (void)cancelPerformSelector:(SEL)aSelector target:(id)target argument:(id)arg;
- (void)cancelPerformSelectorsWithTarget:(id)target;

}

