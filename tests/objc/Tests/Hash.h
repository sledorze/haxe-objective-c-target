

#import "Array.h"

@interface NSMutableDictionary ( Hash )

-F-
- (void) set:(NSMutableString*)key value:(id)value;
-F-
- (id) get:(NSMutableString*)key;
-F-
- (BOOL) exists:(NSMutableString*)key;
-F-
- (BOOL) remove:(NSMutableString*)key;
-F-
- (id) keys;
-F-
- (id) iterator;
-F-
- (NSMutableString*) toString;
-F-
- (id) new;

@end
