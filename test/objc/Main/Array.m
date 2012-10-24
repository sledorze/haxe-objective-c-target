#import "Array.h"

@implementation Array

-F-
- (void) init-E-Block>{
-E-Binop>-V-Field>-E-Field>-V-Const>-E-Const>self.__a = -V-Call>-E-Call>	[[NSMutableArray alloc] init];
}
-F-
@synthesize __a;-F-
@synthesize length;-F-
- (Array*) fromNativeArray:(NSMutableArray*)array-E-Block>{
-E-Binop>-V-Field>-E-Field>-V-Const>-E-Const>self.__a = -V-Local>-E-Local>array;
-E-Return>	return -V-Const>-E-Const>self;
}
-F-
- (Array*) concat:(Array*)a-E-Block>{
-E-Return>	return -V-Local>-E-Local>a;
}
-F-
- (Array*) copy-E-Block>{
-E-Return>	return -V-Call>-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-New>-E-New>[[Array alloc] init] fromNativeArray:1Field>TInst];
}
-F-
- (id) iterator-E-Block>{
-E-Return>	return -V-Const>-E-Const>nil;
}
-F-
- (void) insert:(int)pos x:(**)x-E-Block>{
-E-Call>	[__a insertObject:x atIndex:pos];
}
-F-
- (NSString*) join:(NSString*)sep-E-Block>{
-E-Return>	return -V-Call>-E-Call>	[__a componentsJoinedByString:sep];
}
-F-
- (NSString*) toString-E-Block>{
-E-Return>	return -V-Binop>-E-Binop>-V-Binop>-E-Binop>-V-Const>-E-Const>@"[" + -V-Call>-E-Call>	[__a componentsJoinedByString:@","] + -V-Const>-E-Const>@"]";
}
-F-
- (**) pop-E-Block>{
-E-Return>	return -V-Const>-E-Const>nil;
}
-F-
- (int) push:(**)x-E-Block>{
-E-Call>	[__a addObject:x];
-E-Return>	return -V-Call>-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-Const>-E-Const>self getLength:0TInst];
}
-F-
- (void) unshift:(**)x-E-Block>{
-E-Call>	[__a insertObject:x atIndex:pos];
}
-F-
- (BOOL) remove:(**)x-E-Block>{
-E-Call>	[__a removeObject:x];
-E-Return>	return -V-Const>-E-Const>YES;
}
-F-
- (void) reverse-E-Block>{
}
-F-
- (**) shift-E-Block>{
-E-Return>	return -V-Const>-E-Const>nil;
}
-F-
- (Array*) slice:(int)pos end:(**)end-E-Block>{
-E-Return>	return -V-Const>-E-Const>nil;
}
-F-
- (void) sort:(Function*)f-E-Block>{
}
-F-
- (Array*) splice:(int)pos len:(int)len-E-Block>{
-E-Return>	return -V-Const>-E-Const>nil;
}
-F-
- (int) getLength-E-Block>{
-E-Return>	return -V-Call>-E-Call>	[__a count];
}


@end
