#import "Array.h"

@implementation Array

@synthesize nativeArray;
@synthesize length;
- (Array*) initWithNSMutableArray:(NSMutableArray*)array{
	self.nativeArray = array;
	self.length = [array count];
	return self;
}
- (Array*) concat:(Array*)a{
	
	NSMutableArray *nat = a.nativeArray;
	return nil;
}
- (Array*) copy{
	return [[[Array alloc] init] initWithNSMutableArray:[NSMutableArray arrayWithArray:self.nativeArray]];
}
- (id) iterator{
	return nil;
}
- (void) insert:(int)pos x:(id)x{
	[self.nativeArray insertObject:x atIndex:pos];
	self.length = [self.nativeArray count];
}
- (NSString*) join:(NSString*)sep{
	return [self.nativeArray componentsJoinedByString:sep];
}
- (NSString*) toString{
	return @"[" + [self.nativeArray componentsJoinedByString:@","] + @"]";
}
- (id) pop{
	if (self.length == 0) return nil;;
	id theLastObject = [self.nativeArray lastObject];
	[self.nativeArray removeLastObject];
	self.length = [self.nativeArray count];
	return theLastObject;
}
- (int) push:(id)x{
	[self.nativeArray addObject:x];
	self.length = [self.nativeArray count];
	return [self.nativeArray count];
}
- (id) objectAtIndex:(int)index{
	return [self.nativeArray objectAtIndex:index];
}
- (void) unshift:(id)x{
	[self.nativeArray insertObject:x atIndex:0];
	self.length = [self.nativeArray count];
}
- (BOOL) remove:(id)x{
	BOOL containsObject = [self.nativeArray containsObject:x];
	if (containsObject) [self.nativeArray removeObject:x];;
	self.length = [self.nativeArray count];
	return containsObject;
}
- (void) reverse{
	nativeArray = [[nativeArray reverseObjectEnumerator] allObjects];
}
- (id) shift{
	if (self.length > 0) {
		id obj = [self.nativeArray objectAtIndex:0];
		[self.nativeArray removeObjectAtIndex:0];
		self.length = [self.nativeArray count];
		return obj;
	};;
	return nil;
}
- (Array*) slice:(int)pos end:(id)end{
	return [self.splice:pos len:end - pos];
}
- (void) sort:(Function*)f{
}
- (Array*) splice:(int)pos len:(int)len{
	
	NSMutableArray *newArray = [self.nativeArray subarrayWithRange:NSMakeRange (pos,len)];
	[self.nativeArray removeObjectsInArray:newArray];
	self.length = [self.nativeArray count];
	return [[[Array alloc] init] initWithNSMutableArray:newArray];
}

@end
