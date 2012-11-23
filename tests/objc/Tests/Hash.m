#import "Hash.h"

@implementation Hash

- (void) set:(NSMutableString*)key value:(id)value{
	[self.setObject-non-];
}
- (id) get:(NSMutableString*)key{
	return [self.objectForKey-non-];
}
- (BOOL) exists:(NSMutableString*)key{
	return [self.objectForKey-non-] != nil;
}
- (BOOL) remove:(NSMutableString*)key{
	return [self.removeObjectForKey-non-];
}
- (id) keys{
	
	NSMutabeArray *a = [self.allKeys];
	return [a iterator];
}
- (id) iterator{
	
	NSMutabeArray *a = [self.allValues];
	
	NSMutabeArray *it = [[NSMutableArray alloc] initWithObjects:[a iterator], nil]];
	
	NSMutabeArray *me = [[NSMutableArray alloc] initWithObjects:self, nil]];
	return {hasNext:(BOOL){
		return [[it objectAtIndex:0] GFA2 .hasNext];
	} ,next:(id){
		return [[me objectAtIndex:0].__Internal GFA2 .__Field-non-];
	}};
}
- (NSMutableString*) toString{
	return [self.description];
}
- (id) new{
	self = [super init];
	return self;
}

@end
