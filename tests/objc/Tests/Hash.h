

#import "Array.h"

@interface NSMutableDictionary ( Hash )

- (void) set:(NSMutableString*)key value:(id)value;
- (id) get:(NSMutableString*)key;
- (BOOL) exists:(NSMutableString*)key;
- (BOOL) remove:(NSMutableString*)key;
- (id) keys;
- (id) iterator;
- (NSMutableString*) toString;
- (id) new;

@end
