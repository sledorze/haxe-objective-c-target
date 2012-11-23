/*	NSLocale.h
	Copyright (c) 2003-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>
#import <CoreFoundation/CFLocale.h>

@class NSArray, NSDictionary, NSString;

// Toll-free bridged with CFLocaleRef

extern class NSLocale extends NSObject, implements NSCopying, NSSecureCoding>

- (id)objectForKey:(id)key;

- (NSString *)displayNameForKey:(id)key value:(id)value;

}

extern class NSLocale (NSExtendedLocale)

- (NSString *)localeIdentifier;  // same as NSLocaleIdentifier

}

extern class NSLocale (NSLocaleCreation)

+ (id)systemLocale;
+ (id)currentLocale;
+ (id)autoupdatingCurrentLocale NS_AVAILABLE(10_5, 2_0);

- (id)initWithLocaleIdentifier:(NSString *)string;

}

extern class NSLocale (NSLocaleGeneralInfo)

+ (NSArray *)availableLocaleIdentifiers;
+ (NSArray *)ISOLanguageCodes;
+ (NSArray *)ISOCountryCodes;
+ (NSArray *)ISOCurrencyCodes;
+ (NSArray *)commonISOCurrencyCodes NS_AVAILABLE(10_5, 2_0);
+ (NSArray *)preferredLanguages NS_AVAILABLE(10_5, 2_0);

+ (NSDictionary *)componentsFromLocaleIdentifier:(NSString *)string;
+ (NSString *)localeIdentifierFromComponents:(NSDictionary *)dict;

+ (NSString *)canonicalLocaleIdentifierFromString:(NSString *)string;
+ (NSString *)canonicalLanguageIdentifierFromString:(NSString *)string;

+ (NSString *)localeIdentifierFromWindowsLocaleCode:(uint32_t)lcid NS_AVAILABLE(10_6, 4_0);
+ (uint32_t)windowsLocaleCodeFromLocaleIdentifier:(NSString *)localeIdentifier NS_AVAILABLE(10_6, 4_0);

typedef NS_ENUM(NSUInteger, NSLocaleLanguageDirection) {
    NSLocaleLanguageDirectionUnknown = kCFLocaleLanguageDirectionUnknown,
    NSLocaleLanguageDirectionLeftToRight = kCFLocaleLanguageDirectionLeftToRight,
    NSLocaleLanguageDirectionRightToLeft = kCFLocaleLanguageDirectionRightToLeft,
    NSLocaleLanguageDirectionTopToBottom = kCFLocaleLanguageDirectionTopToBottom,
    NSLocaleLanguageDirectionBottomToTop = kCFLocaleLanguageDirectionBottomToTop
};

+ (NSLocaleLanguageDirection)characterDirectionForLanguage:(NSString *)isoLangCode NS_AVAILABLE(10_6, 4_0);
+ (NSLocaleLanguageDirection)lineDirectionForLanguage:(NSString *)isoLangCode NS_AVAILABLE(10_6, 4_0);

}


FOUNDATION_EXPORT NSString * const NSCurrentLocaleDidChangeNotification NS_AVAILABLE(10_5, 2_0);


FOUNDATION_EXPORT NSString * const NSLocaleIdentifier;		// NSString
FOUNDATION_EXPORT NSString * const NSLocaleLanguageCode;	// NSString
FOUNDATION_EXPORT NSString * const NSLocaleCountryCode;		// NSString
FOUNDATION_EXPORT NSString * const NSLocaleScriptCode;		// NSString
FOUNDATION_EXPORT NSString * const NSLocaleVariantCode;		// NSString
FOUNDATION_EXPORT NSString * const NSLocaleExemplarCharacterSet;// NSCharacterSet
FOUNDATION_EXPORT NSString * const NSLocaleCalendar;		// NSCalendar
FOUNDATION_EXPORT NSString * const NSLocaleCollationIdentifier; // NSString
FOUNDATION_EXPORT NSString * const NSLocaleUsesMetricSystem;	// NSNumber boolean
FOUNDATION_EXPORT NSString * const NSLocaleMeasurementSystem;	// NSString
FOUNDATION_EXPORT NSString * const NSLocaleDecimalSeparator;	// NSString
FOUNDATION_EXPORT NSString * const NSLocaleGroupingSeparator;	// NSString
FOUNDATION_EXPORT NSString * const NSLocaleCurrencySymbol;      // NSString
FOUNDATION_EXPORT NSString * const NSLocaleCurrencyCode;	// NSString
FOUNDATION_EXPORT NSString * const NSLocaleCollatorIdentifier NS_AVAILABLE(10_6, 4_0);  // NSString
FOUNDATION_EXPORT NSString * const NSLocaleQuotationBeginDelimiterKey NS_AVAILABLE(10_6, 4_0);	// NSString
FOUNDATION_EXPORT NSString * const NSLocaleQuotationEndDelimiterKey NS_AVAILABLE(10_6, 4_0);	// NSString
FOUNDATION_EXPORT NSString * const NSLocaleAlternateQuotationBeginDelimiterKey NS_AVAILABLE(10_6, 4_0);	// NSString
FOUNDATION_EXPORT NSString * const NSLocaleAlternateQuotationEndDelimiterKey NS_AVAILABLE(10_6, 4_0);	// NSString

// Values for NSCalendar identifiers (not the NSLocaleCalendar property key)
FOUNDATION_EXPORT NSString * const NSGregorianCalendar;
FOUNDATION_EXPORT NSString * const NSBuddhistCalendar;
FOUNDATION_EXPORT NSString * const NSChineseCalendar;
FOUNDATION_EXPORT NSString * const NSHebrewCalendar;
FOUNDATION_EXPORT NSString * const NSIslamicCalendar;
FOUNDATION_EXPORT NSString * const NSIslamicCivilCalendar;
FOUNDATION_EXPORT NSString * const NSJapaneseCalendar;
FOUNDATION_EXPORT NSString * const NSRepublicOfChinaCalendar NS_AVAILABLE(10_6, 4_0);
FOUNDATION_EXPORT NSString * const NSPersianCalendar NS_AVAILABLE(10_6, 4_0);
FOUNDATION_EXPORT NSString * const NSIndianCalendar NS_AVAILABLE(10_6, 4_0);
FOUNDATION_EXPORT NSString * const NSISO8601Calendar NS_AVAILABLE(10_6, 4_0);

