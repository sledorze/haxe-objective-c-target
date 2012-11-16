#import "Tests.h"

@implementation Tests

@synthesize staticVar1; = @"abcd"

@synthesize interfaceVar1;
@synthesize interfaceVar2;

- (void) tests{
	
	Array *a = [[Array alloc] init];
	
	Array *aa = [[Array alloc] initWithNSMutableArray: [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:1.0], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]];
	float aaa = [aa objectAtIndex:2];
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
	
	Array *aa = [[Array alloc] initWithNSMutableArray: [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]];
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
		[Log trace:@"something" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"57",@"Tests",@"testingWhile",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
		aa++;
	}while (aa < 10);
}
- (void) testTry{
	@try {
		int a = 3;
	}
	@catch (NSException *e) {
		[Log trace:@"error" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"67",@"Tests",@"testTry",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	}
}
- (void) testSwitch{
	switch (YES){
		case YES:{
			{
				int x = 0;
			}}break;
		case NO:{
			{
				int y = 0;
			}}break;
	}
}
- (void) testDate{
	
	Date *d = [[Date alloc] init]2012,11,13,19,30,0;
	
	Date *d2 = [Date["now"]];
	int x = [DateTools getMonthDays:d2];
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
- (void) callLotsOfArguments:(int)arg1 t:(int)t t1:(int)t1 arg4:(int)arg4{
}
- (void) printHello{
	[Log trace:@"Hello from Haxe Objective-C" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"100",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}

@end
