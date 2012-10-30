#import "Tests.h"

@implementation Tests


@synthesize interfaceVar1;
@synthesize interfaceVar2;

- (void) tests{
	
	Array *a = [[Array alloc] init];
	
	Array *aa = [[[[[[[Array alloc] init] add:1] add:2] add:3] add:4] add:5];
	int aaa = [aa objectAtIndex:2];
	[aa objectAtIndex:3];
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
- (void) testingFor{
	
	Array *aa = [[[[[[[Array alloc] init] add:1] add:2] add:3] add:4] add:5];
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			[aa push:i];
		}
	}
	{
		int _g1 = 0; int _g = aa.length;
		while (_g1 < _g) {
			int i = _g1++;
			[aa push:i];
		}
	}
	{
		int _g = 0;
		while (_g < aa.length) {
			int i = [aa objectAtIndex:_g];
			++_g;
			[aa push:i];
		}
	}
}
- (void) testingWhile{
	int aa = 5;
	do {
		[Log trace:@"something" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"60",@"Tests",@"testingWhile",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
		aa++;
	}while (aa < 10);
}
- (void) testTry{
	@try {
		int a = 3;
	}
	@catch (NSException *e) {
		[Log trace:@"error" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"70",@"Tests",@"testTry",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	}
}
- (void) testFrameworksImport{
	
	MKMapView *m = [[MKMapView alloc] init];
}
- (int) getWidth{
	return 0;
}
- (int) setWidth:(int)v{
	return 0;
}
- (int) add:(int)a b:(int)b{
	return a + b;
}
- (int) minus:(int)a b:(int)b{
	return a - b;
}
- (void) callLotsOfArguments:(int)arg1 _:(int)_ arg3:(int)arg3 arg4:(int)arg4{
}
- (void) printHello{
	[Log trace:@"Hello from Haxe Objective-C" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"92",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}

@end
