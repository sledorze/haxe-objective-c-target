//
//  main.m
//  app_delegate_class
//
//  Source generated by Haxe Objective-C target
//



#import "FastCell.h"
#import "Array.h"

@interface FastList : NSObject

@property (nonatomic, strong) FastCell *head;
- (void) add:(id)item;
- (id) first;
- (id) pop;
- (BOOL) isEmpty;
- (BOOL) remove:(id)v;
- (id) iterator;
- (NSMutableString*) toString;
- (id) new;

@end