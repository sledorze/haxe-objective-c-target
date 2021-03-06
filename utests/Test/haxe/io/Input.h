//
//  Input
//  Test
//
//  Source generated by Haxe Objective-C target
//



#import "../../haxe/io/Bytes.h"
#import "../../Array.h"
#import "../../haxe/io/Error.h"
#import "../../haxe/io/BytesBuffer.h"
#import "../../Math.h"
#import "../../String.h"

@interface Input : HXObject

@property (nonatomic, setter=set_bigEndian) BOOL bigEndian;
- (int) readByte;
- (int) readBytes:(Bytes*)s pos:(int)pos len:(int)len;
- (BOOL) set_bigEndian:(BOOL)b;
- (Bytes*) readAll:(int)bufsize;
- (void) readFullBytes:(Bytes*)s pos:(int)pos len:(int)len;
- (Bytes*) read:(int)nbytes;
- (float) readFloat;
- (float) readDouble;
- (int) readInt8;
- (int) readInt16;
- (int) readUInt16;
- (int) readInt24;
- (int) readUInt24;
- (int) readInt32;
- (NSMutableString*) readString:(int)len;

@end

