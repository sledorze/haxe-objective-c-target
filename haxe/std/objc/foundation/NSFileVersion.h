/*
	NSFileVersion.h
	Copyright (c) 2010-2012, Apple Inc.
	All rights reserved.
*/

#import <Foundation/NSObject.h>

@class NSArray, NSDate, NSDictionary, NSError, NSString, NSURL;

typedef NS_OPTIONS(NSUInteger, NSFileVersionAddingOptions) {

    /* Whether +addVersionOfItemAtURL:withContentsOfURL:options:error: can move the new version contents file into the version store instead of copying it. Moving is much faster. See the comment for -temporaryDirectoryURLForNewVersionOfItemAtURL: for an example of when this useful.
    */
    NSFileVersionAddingByMoving = 1 << 0

};

typedef NS_OPTIONS(NSUInteger, NSFileVersionReplacingOptions) {

    /* Whether -replaceItemAtURL:options:error: must move the version's contents out of the version store instead of copying it. This is useful when you want to promote a version's contents to a separate file. You wouldn't use this to restore a version of a file.
    */
    NSFileVersionReplacingByMoving = 1 << 0

};


NS_CLASS_AVAILABLE(10_7, 5_0)
extern class NSFileVersion extends NSObject {


+ (NSFileVersion *)currentVersionOfItemAtURL:(NSURL *)url;
+ (NSArray *)otherVersionsOfItemAtURL:(NSURL *)url;
+ (NSArray *)unresolvedConflictVersionsOfItemAtURL:(NSURL *)url;
+ (NSFileVersion *)versionOfItemAtURL:(NSURL *)url forPersistentIdentifier:(id)persistentIdentifier;
+ (NSFileVersion *)addVersionOfItemAtURL:(NSURL *)url withContentsOfURL:(NSURL *)contentsURL options:(NSFileVersionAddingOptions)options error:(NSError **)outError NS_AVAILABLE_MAC(10_7);
+ (NSURL *)temporaryDirectoryURLForNewVersionOfItemAtURL:(NSURL *)url NS_AVAILABLE_MAC(10_7);

	public var NSURL *URL;
	public var NSString *localizedName;
	public var NSString *localizedNameOfSavingComputer;
	public var NSDate *modificationDate;
	public var id,implements NSObject> persistentIdentifier;
	public var  (readonly, getter=isConflict) BOOL conflict;
	public var  (getter=isResolved) BOOL resolved;
	public var  (getter=isDiscardable) BOOL discardable NS_AVAILABLE_MAC(10_7);

- (NSURL *)replaceItemAtURL:(NSURL *)url options:(NSFileVersionReplacingOptions)options error:(NSError **)error;

- (BOOL)removeAndReturnError:(NSError **)outError;

+ (BOOL)removeOtherVersionsOfItemAtURL:(NSURL *)url error:(NSError **)outError;

}
