package objc.foundation;
/*	NSData.h
	Copyright (c) 1994-2011, Apple Inc. All rights reserved.
*/

/****************	Read/Write Options	****************/

extern enum NSDataReadingOptions {
    NSDataReadingMappedIfSafe;
    NSDataReadingUncached;
    NSDataReadingMappedAlways;
}
extern enum NSDataWritingOptions {	                          
    NSDataWritingAtomic;
    NSDataWritingFileProtectionNone;
    NSDataWritingFileProtectionComplete;
    NSDataWritingFileProtectionCompleteUnlessOpen;
    NSDataWritingFileProtectionCompleteUntilFirstUserAuthentication;
    NSDataWritingFileProtectionMask;
}


/****************	Data Search Options	****************/
extern enum NSDataSearchOptions {
    NSDataSearchBackwards;
    NSDataSearchAnchored;
}

/****************	Immutable Data		****************/

extern class NSData/* implements NSCopying, NSMutableCopying, NSCoding*/ {
	public function length () :Int;
	public function bytes () :Dynamic;

/*- (NSString *)description;
- (void)getBytes:(void *)buffer length:(NSUInteger)length;
- (void)getBytes:(void *)buffer range:(NSRange)range;
- (Bool)isEqualToData:(NSData *)other;
- (NSData *)subdataWithRange:(NSRange)range;
- (Bool)writeToFile:(NSString *)path atomically:(Bool)useAuxiliaryFile;
- (Bool)writeToURL:(NSURL *)url atomically:(Bool)atomically; // the atomically flag is ignored if the url is not of a type the supports atomic writes
- (Bool)writeToFile:(NSString *)path options:(NSDataWritingOptions)writeOptionsMask error:(NSError **)errorPtr;
- (Bool)writeToURL:(NSURL *)url options:(NSDataWritingOptions)writeOptionsMask error:(NSError **)errorPtr;
- (NSRange)rangeOfData:(NSData *)dataToFind options:(NSDataSearchOptions)mask range:(NSRange)searchRange NS_AVAILABLE(10_6, 4_0);


+ (id)data;
+ (id)dataWithBytes:(const void *)bytes length:(NSUInteger)length;
+ (id)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length;
+ (id)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length freeWhenDone:(Bool)b;
+ (id)dataWithContentsOfFile:(NSString *)path options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
+ (id)dataWithContentsOfURL:(NSURL *)url options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
+ (id)dataWithContentsOfFile:(NSString *)path;
+ (id)dataWithContentsOfURL:(NSURL *)url;
- (id)initWithBytes:(const void *)bytes length:(NSUInteger)length;
- (id)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)length;
- (id)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)length freeWhenDone:(Bool)b;
- (id)initWithContentsOfFile:(NSString *)path options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
- (id)initWithContentsOfURL:(NSURL *)url options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
- (id)initWithContentsOfFile:(NSString *)path;
- (id)initWithContentsOfURL:(NSURL *)url;
- (id)initWithData:(NSData *)data;
+ (id)dataWithData:(NSData *)data;*/

}


/****************	Mutable Data		****************/

extern class NSMutableData extends NSData {
	
/*	- (void *)mutableBytes;
	- (void)setLength:(NSUInteger)length;
	
	- (void)appendBytes:(const void *)bytes length:(NSUInteger)length;
	- (void)appendData:(NSData *)other;
	- (void)increaseLengthBy:(NSUInteger)extraLength;
	- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)bytes;
	- (void)resetBytesInRange:(NSRange)range;
	- (void)setData:(NSData *)data;
	- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)replacementBytes length:(NSUInteger)replacementLength;
	
	+ (id)dataWithCapacity:(NSUInteger)aNumItems;
	+ (id)dataWithLength:(NSUInteger)length;
	- (id)initWithCapacity:(NSUInteger)capacity;
	- (id)initWithLength:(NSUInteger)length;*/
	
}


/****************	    Purgeable Data	****************/

/*extern class NSPurgeableData extends NSMutableData implements NSDiscardableContent {

    NSUInteger _length;
    int32_t _accessCount;
    uint8_t _private[32];
    void *_reserved;
}
*/