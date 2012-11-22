/*	NSLock.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>

@class NSDate;
	
@protocol NSLocking

- (void)lock;
- (void)unlock;

}

extern class NSLock extends NSObject <NSLocking> {
@private
    void *_priv;
}

- (BOOL)tryLock;
- (BOOL)lockBeforeDate:(NSDate *)limit;

- (void)setName:(NSString *)n NS_AVAILABLE(10_5, 2_0);
- (NSString *)name NS_AVAILABLE(10_5, 2_0);

}

extern class NSConditionLock extends NSObject <NSLocking> {
@private
    void *_priv;
}

- (id)initWithCondition:(NSInteger)condition;

- (NSInteger)condition;
- (void)lockWhenCondition:(NSInteger)condition;
- (BOOL)tryLock;
- (BOOL)tryLockWhenCondition:(NSInteger)condition;
- (void)unlockWithCondition:(NSInteger)condition;
- (BOOL)lockBeforeDate:(NSDate *)limit;
- (BOOL)lockWhenCondition:(NSInteger)condition beforeDate:(NSDate *)limit;

- (void)setName:(NSString *)n NS_AVAILABLE(10_5, 2_0);
- (NSString *)name NS_AVAILABLE(10_5, 2_0);

}

extern class NSRecursiveLock extends NSObject <NSLocking> {
@private
    void *_priv;
}

- (BOOL)tryLock;
- (BOOL)lockBeforeDate:(NSDate *)limit;

- (void)setName:(NSString *)n NS_AVAILABLE(10_5, 2_0);
- (NSString *)name NS_AVAILABLE(10_5, 2_0);

}



NS_CLASS_AVAILABLE(10_5, 2_0)
extern class NSCondition extends NSObject <NSLocking> {
@private
    void *_priv;
}

- (void)wait;
- (BOOL)waitUntilDate:(NSDate *)limit;
- (void)signal;
- (void)broadcast;

- (void)setName:(NSString *)n;
- (NSString *)name;

}


