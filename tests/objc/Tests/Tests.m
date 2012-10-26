#import "Tests.h"

@implementation Tests




@synthesize interfaceVar1;
@synthesize interfaceVar2;

- (void) tests{
	Array *a = [[Array alloc] init];
	Array *aa = [[Array alloc] initWithNSMutableArray:[[NSMutableArray alloc] initWithObjects: 1, 2, 3, 4, 5, nil]];
	int b = 5;
	float c = 5.0;
	NSString *d = @"xyz";
	BOOL e = YES;
	int f;
	int g = (int*);
	int xy = a.length;
	[a push:@"6"];
{
		int _g = 0;
		while794 (		_g < 5) {
			int i = _g++;
			[aa push:i];
		}
	}
	if (	a.length > 3) 	f = 3
	else 	f = a.length;
	f = ( (	a.length > 3)?3:a.length);
	int x = 	[[[Tests alloc] init] add:1 b:1];
}

- (int) getWidth{
	return 0;
}

- (int) setWidth:(int)v{
	return 0;
}

- (int) add:(int)a b:(int)b{
	return 	a + b;
}

- (int) minus:(int)a b:(int)b{
	return 	a - b;
}

- (void) callLotsOfArguments:(int)arg1 _:(int)_ _1:(int)_1 arg4:(int)arg4{
}

- (void) printHello{
	[Log trace:@"Hello from Haxe Objective-C" infos:	{	fileName:@"Tests.hx" ,	lineNumber:66 ,	className:@"Tests" ,	methodName:@"printHello"	}];
}


@end
