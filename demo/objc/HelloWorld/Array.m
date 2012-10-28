#import "Array.h"

@implementation Array



@synthesize __a;
@synthesize length;
- (Array*) initWithNSMutableArray:(NSMutableArray*)array
{
	self.__a = 	[NSMutableArray arrayWithArray:array];
	return self;
}

- (Array*) concat:(Array*)a
{
	return a;
}

- (Array*) copy
{
	return 	[[[Array alloc] init].initWithNSMutableArray:self.__a];
}

- (id) iterator
{
	return nil;
}

- (void) insert:(int)pos x:(id)x
{
	[self.__a insertObject:x atIndex:pos];
}

- (NSString*) join:(NSString*)sep
{
	return 	[self.__a componentsJoinedByString:sep];
}

- (NSString*) toString
{
	return 		@"[" + 	[self.__a componentsJoinedByString:@","] + @"]";
}

- (id) pop
{
	return nil;
}

- (int) push:(id)x
{
	[self.add:x];
	return 	[self.__a count];
}

- (Array*) add:(id)x
{
	[self.__a addObject:x];
	return self;
}

- (void) unshift:(id)x
{
	[self.__a insertObject:x atIndex:0];
}

- (BOOL) remove:(id)x
{
	[__a removeObject:x];
	return YES;
}

- (void) reverse
{
}

- (id) shift
{
	return nil;
}

- (Array*) slice:(int)pos end:(id)end
{
	return nil;
}

- (void) sort:(Function*)f
{
}

- (Array*) splice:(int)pos len:(int)len
{
	return nil;
}

- (int) getLength
{
	return 	[self.__a count];
}


@end
