#import "Tests.h"

@implementation Tests

+ (NSMutableString*) staticVar1:(NSMutableString*)val {
	static NSMutableString *_val;
	if (val == nil) { if (_val == nil) _val = @"abcd"; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) staticVar2:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 5; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) staticVar3:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 5; }
	else { if (_val != nil) _val = val; }
	return _val;
}

@synthesize interfaceVar1;
@synthesize interfaceVar2;

- (void) tests{
	
	NSMutabeArray *a = [[NSMutabeArray alloc] new][];
	
	NSMutabeArray *aa = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:1.0], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]];
	float aaa = [aa objectAtIndex:2];
	[aa objectAtIndex:3];
	int b = 5;
	float c = 5.0;
	
	NSMutableString *d = @"xyz";
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
	int x = [[[Tests alloc] new][].add:1 b:1];
}
- (void) testingFor{
	
	NSMutabeArray *aa = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]];
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
		[Log trace:@"something" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"59",@"Tests",@"testingWhile",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
		aa++;
	}while (aa < 10);
}
- (void) testTry{
	@try {
		int a = 3;
	}
	@catch (NSException *e) {
		[Log trace:@"error" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"69",@"Tests",@"testTry",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
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
	
	NSDate *d = [[NSDate alloc] new:2012,11,13,19,30,0][];
	
	NSDate *d2 = [NSDate now];
	int x = [DateTools getMonthDays:d2];
}
- (void) testString{
	
	NSMutableString *string = [[NSMutableString alloc] new:@"abcdefghijklmnopqrstuvwxyz"][];
	int len = string.length;
	
	NSMutableString *s = [string characterAtIndex:5];
	id ch = [string characterAtIndex:5];
	int i = [string rangeOfString:@"abc" startIndex:nil];
	int i1 = [string rangeOfString:@"abc" startIndex:2];
	int li = [string rangeOfString options:NSBackwardsSearch:@"abc" startIndex:nil];
	
	NSMutabeArray *components = [string componentsSeparatedByString:split:@"-"];
	
	NSMutableString *s2 = [string substringWithRange:substr:5 len:nil];
	s2 = [string substringWithRange:substr:5 len:len];
	s2 = [string substringWithRange:substring:5 endIndex:nil];
	s2 = [string substringWithRange:substring:1 endIndex:len];
	s2 = [string lowercaseString];
	s2 = [string uppercaseString];
	s2 = [string description];
	
	NSMutableString *s3 = @"\t";
}
- (void) testFrameworksImport{
	
	MKMapView *m = [[MKMapView alloc] new][];
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
	[Log trace:@"Hello from Haxe Objective-C" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"121",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
- (id) new{
	self = [super init];
	self.interfaceVar1 = 6;
	return self;
}

@end
