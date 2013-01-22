/*	NSCharacterSet.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

#import <CoreFoundation/CFCharacterSet.h>
import objc.foundation.NSObject;
#import <Foundation/NSRange.h>
#import <Foundation/NSString.h>

@class NSData;

enum {
    NSOpenStepUnicodeReservedBase = 0xF400
};

extern class NSCharacterSet extends NSObject, implements NSCopying, NSMutableCopying, NSCoding>

+ (id)controlCharacterSet;
+ (id)whitespaceCharacterSet;
+ (id)whitespaceAndNewlineCharacterSet;
+ (id)decimalDigitCharacterSet;
+ (id)letterCharacterSet;
+ (id)lowercaseLetterCharacterSet;
+ (id)uppercaseLetterCharacterSet;
+ (id)nonBaseCharacterSet;
+ (id)alphanumericCharacterSet;
+ (id)decomposableCharacterSet;
+ (id)illegalCharacterSet;
+ (id)punctuationCharacterSet;
+ (id)capitalizedLetterCharacterSet;
+ (id)symbolCharacterSet;
+ (id)newlineCharacterSet NS_AVAILABLE(10_5, 2_0);

+ (id)characterSetWithRange:(NSRange)aRange;
+ (id)characterSetWithCharactersInString:(NSString *)aString;
+ (id)characterSetWithBitmapRepresentation:(NSData *)data;
+ (id)characterSetWithContentsOfFile:(NSString *)fName;

- (Bool)characterIsMember:(unichar)aCharacter;
- (NSData *)bitmapRepresentation;
- (NSCharacterSet *)invertedSet;

- (Bool)longCharacterIsMember:(UTF32Char)theLongChar;

- (Bool)isSupersetOfSet:(NSCharacterSet *)theOtherSet;
- (Bool)hasMemberInPlane:(uint8_t)thePlane;
}

extern class NSMutableCharacterSet extends NSCharacterSet <NSCopying, NSMutableCopying>

- (void)addCharactersInRange:(NSRange)aRange;
- (void)removeCharactersInRange:(NSRange)aRange;
- (void)addCharactersInString:(NSString *)aString;
- (void)removeCharactersInString:(NSString *)aString;
- (void)formUnionWithCharacterSet:(NSCharacterSet *)otherSet;
- (void)formIntersectionWithCharacterSet:(NSCharacterSet *)otherSet;
- (void)invert;

}

