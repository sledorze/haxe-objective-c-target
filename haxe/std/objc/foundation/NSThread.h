/*	NSThread.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>
#import <Foundation/NSDate.h>

@class Array<>, NSMutableDictionary, NSDate;

extern class NSThread extends NSObject  {
@private
    id _private;
    uint8_t _bytes[44];
}

+ (NSThread *)currentThread;

+ (void)detachNewThreadSelector:(SEL)selector toTarget:(id)target withObject:(id)argument;

+ (Bool)isMultiThreaded;

- (NSMutableDictionary *)threadDictionary;

+ (void)sleepUntilDate:(NSDate *)date;
+ (void)sleepForTimeInterval:(NSTimeInterval)ti;

+ (void)exit;

+ (double)threadPriority;
+ (Bool)setThreadPriority:(double)p;

- (double)threadPriority NS_AVAILABLE(10_6, 4_0);
- (void)setThreadPriority:(double)p NS_AVAILABLE(10_6, 4_0);

+ (Array<> *)callStackReturnAddresses NS_AVAILABLE(10_5, 2_0);
+ (Array<> *)callStackSymbols NS_AVAILABLE(10_6, 4_0);

- (void)setName:(NSString *)n NS_AVAILABLE(10_5, 2_0);
- (NSString *)name NS_AVAILABLE(10_5, 2_0);

- (NSUInteger)stackSize NS_AVAILABLE(10_5, 2_0);
- (void)setStackSize:(NSUInteger)s NS_AVAILABLE(10_5, 2_0);

- (Bool)isMainThread NS_AVAILABLE(10_5, 2_0);
+ (Bool)isMainThread NS_AVAILABLE(10_5, 2_0); // reports whether current thread is main
+ (NSThread *)mainThread NS_AVAILABLE(10_5, 2_0);

- (id)init NS_AVAILABLE(10_5, 2_0);	// designated initializer
- (id)initWithTarget:(id)target selector:(SEL)selector object:(id)argument NS_AVAILABLE(10_5, 2_0);

- (Bool)isExecuting NS_AVAILABLE(10_5, 2_0);
- (Bool)isFinished NS_AVAILABLE(10_5, 2_0);

- (Bool)isCancelled NS_AVAILABLE(10_5, 2_0);
- (void)cancel NS_AVAILABLE(10_5, 2_0);

- (void)start NS_AVAILABLE(10_5, 2_0);

- (void)main NS_AVAILABLE(10_5, 2_0);	// thread body method

}

FOUNDATION_EXPORT NSString * const NSWillBecomeMultiThreadedNotification;
FOUNDATION_EXPORT NSString * const NSDidBecomeSingleThreadedNotification;
FOUNDATION_EXPORT NSString * const NSThreadWillExitNotification;

extern class NSObject (NSThreadPerformAdditions)

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(Bool)wait modes:(Array<> *)array;
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(Bool)wait;
	// equivalent to the first method with kCFRunLoopCommonModes

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(Bool)wait modes:(Array<> *)array NS_AVAILABLE(10_5, 2_0);
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(Bool)wait NS_AVAILABLE(10_5, 2_0);
	// equivalent to the first method with kCFRunLoopCommonModes
- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg NS_AVAILABLE(10_5, 2_0);

}

