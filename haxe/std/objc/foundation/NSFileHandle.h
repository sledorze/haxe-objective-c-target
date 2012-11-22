/*	NSFileHandle.h
	Copyright (c) 1995-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSRange.h>

@class NSString, NSData, NSError;

extern class NSFileHandle extends NSObject <NSSecureCoding>

- (NSData *)availableData;

- (NSData *)readDataToEndOfFile;
- (NSData *)readDataOfLength:(NSUInteger)length;

- (void)writeData:(NSData *)data;

- (unsigned long long)offsetInFile;
- (unsigned long long)seekToEndOfFile;
- (void)seekToFileOffset:(unsigned long long)offset;

- (void)truncateFileAtOffset:(unsigned long long)offset;
- (void)synchronizeFile;
- (void)closeFile;

}

extern class NSFileHandle (NSFileHandleCreation)

+ (id)fileHandleWithStandardInput;
+ (id)fileHandleWithStandardOutput;
+ (id)fileHandleWithStandardError;
+ (id)fileHandleWithNullDevice;

+ (id)fileHandleForReadingAtPath:(NSString *)path;
+ (id)fileHandleForWritingAtPath:(NSString *)path;
+ (id)fileHandleForUpdatingAtPath:(NSString *)path;

+ (id)fileHandleForReadingFromURL:(NSURL *)url error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
+ (id)fileHandleForWritingToURL:(NSURL *)url error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
+ (id)fileHandleForUpdatingURL:(NSURL *)url error:(NSError **)error NS_AVAILABLE(10_6, 4_0);

}

FOUNDATION_EXPORT NSString * const NSFileHandleOperationException;

FOUNDATION_EXPORT NSString * const NSFileHandleReadCompletionNotification;
FOUNDATION_EXPORT NSString * const NSFileHandleReadToEndOfFileCompletionNotification;
FOUNDATION_EXPORT NSString * const NSFileHandleConnectionAcceptedNotification;
FOUNDATION_EXPORT NSString * const NSFileHandleDataAvailableNotification;

FOUNDATION_EXPORT NSString * const NSFileHandleNotificationDataItem;
FOUNDATION_EXPORT NSString * const NSFileHandleNotificationFileHandleItem;
FOUNDATION_EXPORT NSString * const NSFileHandleNotificationMonitorModes NS_DEPRECATED(10_0, 10_7, 2_0, 5_0);

extern class NSFileHandle (NSFileHandleAsynchronousAccess)

- (void)readInBackgroundAndNotifyForModes:(NSArray *)modes;
- (void)readInBackgroundAndNotify;

- (void)readToEndOfFileInBackgroundAndNotifyForModes:(NSArray *)modes;
- (void)readToEndOfFileInBackgroundAndNotify;

- (void)acceptConnectionInBackgroundAndNotifyForModes:(NSArray *)modes;
- (void)acceptConnectionInBackgroundAndNotify;

- (void)waitForDataInBackgroundAndNotifyForModes:(NSArray *)modes;
- (void)waitForDataInBackgroundAndNotify;

#ifdef __BLOCKS__
	public var  (copy) void (^readabilityHandler)(NSFileHandle *)  NS_AVAILABLE(10_7, 5_0);
	public var  (copy) void (^writeabilityHandler)(NSFileHandle *) NS_AVAILABLE(10_7, 5_0);
#endif

}

extern class NSFileHandle (NSFileHandlePlatformSpecific)

- (id)initWithFileDescriptor:(int)fd closeOnDealloc:(BOOL)closeopt;
- (id)initWithFileDescriptor:(int)fd;
- (int)fileDescriptor;

}

extern class NSPipe extends NSObject

- (NSFileHandle *)fileHandleForReading;
- (NSFileHandle *)fileHandleForWriting;

- (id)init;
+ (id)pipe;

}

