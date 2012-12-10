/*	NSScanner.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>

@class NSString, NSCharacterSet, NSDictionary;

extern class NSScanner extends NSObject, implements NSCopying>

- (NSString *)string;
- (NSUInteger)scanLocation;
- (void)setScanLocation:(NSUInteger)pos;
- (void)setCharactersToBeSkipped:(NSCharacterSet *)set;
- (void)setCaseSensitive:(Bool)flag;
- (void)setLocale:(id)locale;

}

extern class NSScanner (NSExtendedScanner)

- (NSCharacterSet *)charactersToBeSkipped;
- (Bool)caseSensitive;
- (id)locale;

- (Bool)scanInt:(int *)value;
- (Bool)scanInteger:(NSInteger *)value NS_AVAILABLE(10_5, 2_0);
- (Bool)scanHexLongLong:(unsigned long long *)result NS_AVAILABLE(10_5, 2_0);
- (Bool)scanHexFloat:(float *)result NS_AVAILABLE(10_5, 2_0);		// Corresponding to %a or %A formatting. Requires "0x" or "0X" prefix. 
- (Bool)scanHexDouble:(double *)result NS_AVAILABLE(10_5, 2_0);		// Corresponding to %a or %A formatting. Requires "0x" or "0X" prefix. 
- (Bool)scanHexInt:(unsigned *)value;		// Optionally prefixed with "0x" or "0X"
- (Bool)scanLongLong:(long long *)value;
- (Bool)scanFloat:(float *)value;
- (Bool)scanDouble:(double *)value;

- (Bool)scanString:(NSString *)string intoString:(NSString **)value;
- (Bool)scanCharactersFromSet:(NSCharacterSet *)set intoString:(NSString **)value;

- (Bool)scanUpToString:(NSString *)string intoString:(NSString **)value;
- (Bool)scanUpToCharactersFromSet:(NSCharacterSet *)set intoString:(NSString **)value;

- (Bool)isAtEnd;

- (id)initWithString:(NSString *)string;
+ (id)scannerWithString:(NSString *)string;
+ (id)localizedScannerWithString:(NSString *)string;

}

