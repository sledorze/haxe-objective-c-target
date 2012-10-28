#import "Tests.h"

@implementation Tests




@synthesize interfaceVar1;
@synthesize interfaceVar2;

- (void) tests
{
	
	Array *a = [[Array alloc] init];
	
	Array *aa = [[[[[[[Array alloc] init] add:1] add:2] add:3] add:4] add:5];
	int b = 5;
	float c = 5.0;
	
	NSString *d = @"xyz";
	BOOL e = YES;
	int f;
	int g = (int)5.3;
	id g1 = (id)6.3;
	id g2 = (id)a;
	int xy = a.length;
	[a push:@"6"];
	if (a.length > 3) f = 3;
	else f = a.length;
	f = ( (a.length > 3) ? 3 : a.length);
	int x = [[[Tests alloc] init] add:1 b:1];
}

- (void) testingFor
{
	
	Array *aa = [[[[[[[Array alloc] init] add:1] add:2] add:3] add:4] add:5];
	
	{
		int _g = 0;
		while (_g < 5) 
		{
			int i = _g++;
			[aa push:i];
		}
		;
	}
	;
	
	{
		int _g1 = 0; int _g2 = aa.length;
		while (_g1 < _g2) 
		{
			int i1 = _g1++;
			[aa push:i1];
		}
		;
	}
	;
	
	{
		int _g3 = 0;
		while (_g3 < aa.length) 
		{
			int i2 = [aa objectAtIndex:_g3];
			++_g3;
			[aa push:i2];
		}
		;
	}
	;
}

- (void) testingWhile
{
	int aa = 5;
	do 
	{
		[Log trace:@"something" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"58",@"Tests",@"testingWhile",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
		aa++;
	}
	while (aa < 10);
}

- (int) getWidth
{
	return 0;
}

- (int) setWidth:(int)v
{
	return 0;
}

- (int) add:(int)a b:(int)b
{
	return a + b;
}

- (int) minus:(int)a b:(int)b
{
	return a - b;
}

- (void) callLotsOfArguments:(int)arg1 _:(int)_ arg3:(int)arg3 arg4:(int)arg4
{
}

- (void) printHello
{
	[Log trace:@"Hello from Haxe Objective-C" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"77",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}


@end
