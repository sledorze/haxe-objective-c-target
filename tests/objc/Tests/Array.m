#import "Array.h"

@implementation Array

@synthesize length;
- (NSMutabeArray*) concat:(NSMutabeArray*)a{
	return [self.arrayByAddingObjectsFromArray -dynamic_param- ];
}
- (NSMutabeArray*) copy{
	return [NSMutabeArray arrayWithArray -dynamic_param- ];
}
- (id) iterator{
	return nil;
}
- (void) insert:(int)pos x:(id)x{
	[self.insertObject -dynamic_param- ];
}
- (NSMutableString*) join:(NSMutableString*)sep{
	return [self.componentsJoinedByString -dynamic_param- ];
}
- (NSMutableString*) toString{
	return @"[" +  ([self.componentsJoinedByString -dynamic_param- ] + @"]");
}
- (id) pop{
	if (self.length == 0) return nil;;
	id theLastObject = [self.lastObject];
	[self.removeLastObject];
	return theLastObject;
}
- (int) push:(id)x{
	[self.addObject -dynamic_param- ];
	return [self.count];
}
- (void) unshift:(id)x{
	[self.insertObject -dynamic_param- ];
}
- (BOOL) remove:(id)x{
	BOOL containsObject = [self.containsObject -dynamic_param- ];
	if (containsObject) [self.removeObject -dynamic_param- ];;
	return containsObject;
}
- (void) reverse{
	self = [[self reverseObjectEnumerator] allObjects];
}
- (id) shift{
	if ([self.count] > 0) {
		id obj = [self.objectAtIndex -dynamic_param- ];
		[self.removeObjectAtIndex -dynamic_param- ];
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
	
	NSMutabeArray *newArray = [self.subarrayWithRange -dynamic_param- ];
	[self.removeObjectsInArray -dynamic_param- ];
	return [NSMutabeArray arrayWithArray -dynamic_param- ];
}
- (id) new{
	self = [super init];
	return self;
}

@end
