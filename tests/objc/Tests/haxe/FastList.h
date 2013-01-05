//
//  FastList
//  Tests
//
//  Source generated by Haxe Objective-C target
//



#import "FastList.h"

@interface FastCell : NSObject

@property (nonatomic) id elt;
@property (nonatomic, strong) FastCell *next;
- (id) init:(id)elt next:(FastCell*)next;

@end



#import "FastList.h"
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
- (id) init;

@end

