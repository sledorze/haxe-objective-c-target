/*	NSSet.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>
#import <Foundation/NSEnumerator.h>

@class Array<>, NSDictionary, NSString;

/****************	Immutable Set	****************/

extern class NSSet extends NSObject, implements NSCopying, NSMutableCopying, NSSecureCoding, NSFastEnumeration>

- (NSUInteger)count;
- (id)member:(id)object;
- (NSEnumerator *)objectEnumerator;

}

extern class NSSet (NSExtendedSet)

- (Array<> *)allObjects;
- (id)anyObject;
- (Bool)containsObject:(id)anObject;
- (NSString *)description;
- (NSString *)descriptionWithLocale:(id)locale;
- (Bool)intersectsSet:(NSSet *)otherSet;
- (Bool)isEqualToSet:(NSSet *)otherSet;
- (Bool)isSubsetOfSet:(NSSet *)otherSet;

- (void)makeObjectsPerformSelector:(SEL)aSelector;
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;

- (NSSet *)setByAddingObject:(id)anObject NS_AVAILABLE(10_5, 2_0);
- (NSSet *)setByAddingObjectsFromSet:(NSSet *)other NS_AVAILABLE(10_5, 2_0);
- (NSSet *)setByAddingObjectsFromArray:(Array<> *)other NS_AVAILABLE(10_5, 2_0);

#if NS_BLOCKS_AVAILABLE
- (void)enumerateObjectsUsingBlock:(void (^)(id obj, Bool *stop))block NS_AVAILABLE(10_6, 4_0);
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id obj, Bool *stop))block NS_AVAILABLE(10_6, 4_0);

- (NSSet *)objectsPassingTest:(Bool (^)(id obj, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSSet *)objectsWithOptions:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
#endif

}

extern class NSSet (NSSetCreation)

+ (id)set;
+ (id)setWithObject:(id)object;
+ (id)setWithObjects:(const id [])objects count:(NSUInteger)cnt;
+ (id)setWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
+ (id)setWithSet:(NSSet *)set;
+ (id)setWithArray:(Array<> *)array;

- (id)initWithObjects:(const id [])objects count:(NSUInteger)cnt;
- (id)initWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithSet:(NSSet *)set;
- (id)initWithSet:(NSSet *)set copyItems:(Bool)flag;
- (id)initWithArray:(Array<> *)array;

}

/****************	Mutable Set	****************/

extern class NSMutableSet extends NSSet

- (void)addObject:(id)object;
- (void)removeObject:(id)object;

}

extern class NSMutableSet (NSExtendedMutableSet)

- (void)addObjectsFromArray:(Array<> *)array;
- (void)intersectSet:(NSSet *)otherSet;
- (void)minusSet:(NSSet *)otherSet;
- (void)removeAllObjects;
- (void)unionSet:(NSSet *)otherSet;

- (void)setSet:(NSSet *)otherSet;

}

extern class NSMutableSet (NSMutableSetCreation)

+ (id)setWithCapacity:(NSUInteger)numItems;
- (id)initWithCapacity:(NSUInteger)numItems;
    
}

/****************	Counted Set	****************/

extern class NSCountedSet extends NSMutableSet {
    @private
    id _table;
    void *_reserved;
}

- (id)initWithCapacity:(NSUInteger)numItems; // designated initializer

- (id)initWithArray:(Array<> *)array;
- (id)initWithSet:(NSSet *)set;

- (NSUInteger)countForObject:(id)object;

- (NSEnumerator *)objectEnumerator;
- (void)addObject:(id)object;
- (void)removeObject:(id)object;

}

