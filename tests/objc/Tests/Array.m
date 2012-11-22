#import "Array.h"

@implementation Array

@synthesize nativeArray;
@synthesize length;
- (NSMutabeArray*) initWithNSMutableArray:(NSMutableArray*)array{
	self.nativeArray = array;
	self.length = [array count];
	return self;
}
- (NSMutabeArray*) concat:(NSMutabeArray*)a{
	
	NSMutableArray *nat = a.nativeArray;
	return nil;
}
- (NSMutabeArray*) copy{
	return [[[NSMutabeArray alloc] new][].initWithNSMutableArray:[NSMutableArray arrayWithArray:self.nativeArray]];
}
- (id) iterator{
	return nil;
}
- (void) insert:(int)pos x:(id)x{
	[self.nativeArray insertObject:x atIndex:pos];
	self.length = [self.nativeArray count];
}
- (NSMutableString*) join:(NSMutableString*)sep{
	return [self.nativeArray componentsJoinedByString:sep];
}
- (NSMutableString*) toString{
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
- (NSMutabeArray*) slice:(int)pos end:(id)end{
	return [self.splice:pos len:end - pos];
}
- (void) sort:(Function*)f{
}
- (NSMutabeArray*) splice:(int)pos len:(int)len{
	
	NSMutableArray *newArray = [self.nativeArray subarrayWithRange:NSMakeRange (pos,len)];
	[self.nativeArray removeObjectsInArray:newArray];
	self.length = [self.nativeArray count];
	return [[[NSMutabeArray alloc] new][].initWithNSMutableArray:newArray];
}
- (id) new{
	self = [super init];
	self.nativeArray = [[NSMutableArray alloc] new][];
	self.length = 0;
	return self;
}

@end
