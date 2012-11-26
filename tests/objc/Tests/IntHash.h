

#import "Array.h"

@interface  ( IntHash )

-F-
- (void) set:(int)key value:(id)value;
-F-
- (id) get:(int)key;
-F-
- (BOOL) exists:(int)key;
-F-
- (BOOL) remove:(int)key;
-F-
- (id) keys;
-F-
- (id) iterator;
-F-
- (NSMutableString*) toString;
-F-
- (id) new;

@end
