//
//  Tests
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Tests.h"

@implementation Tests

+ (NSMutableString*) staticVar1:(NSMutableString*)val {
	static NSMutableString *_val;
	if (val == nil) { if (_val == nil) _val = (NSMutableString*)@"abcd"; }
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

@synthesize d1;
@synthesize d2;
@synthesize s;
- (void) testVariables{
	
	NSMutableArray *a = [[NSMutableArray alloc] init];
	int b = 5;
	float c = 5.0;
	
	NSMutableString *d = (NSMutableString*)@"xyz";
	BOOL e = YES;
	int f;
	int g = (int)5.3;
	id g1 = (id)6.3;
	id g2 = (id)a;
	int xy = a.length;
	[a push:(NSMutableString*)@"6"];
	if (a.length > 3) f = 3
	else f = a.length;
	f = ( (a.length > 3) ? 3 : a.length);
	int x = [[[Tests alloc] init] add:1 b:1];
	[Lib print:(NSMutableString*)@"print print and print again"];
	[Lib println:(NSMutableString*)@"print print and print again"];
}
- (void) testingFor{
	
	NSMutableArray *aa = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]];
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
- (void) testWhile{
	int aa = 5;
	do {
		[Log trace:(NSMutableString*)@"do something" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"88",@"Tests",@"testWhile",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
		aa++;
	}while (aa < 10);
	while (aa > 0) aa--;
}
- (void) testTry{
	@try {
		int a = 3;
	}
	@catch (NSException *e) {
		[Log trace:(NSMutableString*)@"error" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"105",@"Tests",@"testTry",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	}
}
- (void) testSwitch{
	BOOL _g = YES;
	switch (_g){
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
- (void) testArray{
	
	NSMutableArray *as = [[NSMutableArray alloc] init];
	
	NSMutableArray *aa = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:1.0], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]];
	float aaa = [aa objectAtIndex:2];
	[aa objectAtIndex:3];
	
	NSMutableArray *concatArray = [as concat:[[NSMutableArray alloc] initWithObjects:(NSMutableString*)@"5", (NSMutableString*)@"6", (NSMutableString*)@"7", nil]]];
	concatArray = [as copy];
	[concatArray insert:2 x:(NSMutableString*)@"2"];
	id iter = [as iterator];
	
	NSMutableString *s = [concatArray join:(NSMutableString*)@", "];
	
	NSMutableString *item = [as pop];
	[as push:(NSMutableString*)@"454"];
	BOOL bool = [as remove:(NSMutableString*)@"5"];
	[as reverse];
	item = [as shift];
	
	NSMutableArray *sliceArray = [as slice:1 end:3];
	[as sort:^(int):(NSMutableString*)a b:(NSMutableString*)b{
		return 0;
	}];
	sliceArray = [as splice:2 len:2];
	s = [as toString];
	[as unshift:(NSMutableString*)@"44"];
}
- (void) testDate{
	
	NSDate *d = [[NSDate alloc] init:2012 month:11 day:13 hour:19 min:30 sec:0];
	int _int = [d getDate];
	_int = [d getDay];
	_int = [d getFullYear];
	_int = [d getHours];
	_int = [d getMinutes];
	_int = [d getMonth];
	_int = [d getSeconds];
	float _float = [d getTime];
	
	NSMutableString *str = [d toString];
	
	NSDate *d2 = [NSDate fromString:(NSMutableString*)@"2012-12-12 06:40:00"];
	d2 = [NSDatefromTime:120000];
	d2 = [NSDatenow];
	int x = [DateTools getMonthDays:d2];
	_float = [DateTools days:5];
	
	NSDate *d3 = [DateTools delta:d t:1000.0];
	str = [DateTools format:d f:(NSMutableString*)@"HH:mm"];
	_int = [DateTools getMonthDays:d];
	_float = [DateTools hours:1000];
	_float = [DateTools make:struct {
	seconds:0; ms:(float)110; minutes:6; hours:8; days:5
	} structName];
	_float = [DateTools minutes:56];
	id obj = [DateTools parse:45546];
	_float = [DateTools seconds:1000];
}
- (int) enumToInt:(Tests*)c{
	[self testEnum:TestsEnumExtern ExternEnumValue1];
	return ((int)($this:(snd ctx.path)) 
	var $e2 : enum =  (c)
	switch ( $e2.index ) {
		
		case 0:
		{
			__r__ = 16711680}break
		case 1:
		{
			__r__ = 65280}break
		case 2:
		{
			__r__ = 255}break
		case 3:
		
		var MATCH c_eGrey_0 : int = $e2.params[0]{
			__r__ = ((c_eGrey_0 << 16 | c_eGrey_0 << 8) | c_eGrey_0)}break
		case 4:
		
		var MATCH c_eRgb_2 : int = $e2.params[2], MATCH c_eRgb_1 : int = $e2.params[1], MATCH c_eRgb_0 : int = $e2.params[0]{
			__r__ = ((c_eRgb_0 << 16 | c_eRgb_1 << 8) | c_eRgb_2)}break
		case 5:
		
		var MATCH c_eAlpha_1 : Tests = $e2.params[1], MATCH c_eAlpha_0 : int = $e2.params[0]{
			__r__ = (c_eAlpha_0 << 24 | ([self enumToInt:c_eAlpha_1] & 16777215))}break
	}
	return __r__{
		
		int* __r__}
	}(self));
}
- (void) testEnum:(id)v{
	int i = ((int)($this:(snd ctx.path)) 
	var $e2 : enum =  (v)
	switch ( $e2.index ) {
		
		case 0:
		{
			__r__ = 5}break
		case 1:
		{
			__r__ = 6}break
		case 2:
		{
			__r__ = 7}break
	}
	return __r__{
		
		int* __r__}
	}(self));
	
	Tests *red = Color2 Red2;
	int j = ((int)($this:(snd ctx.path)) 
	var $e4 : enum =  (red)
	switch ( $e4.index ) {
		
		case 0:
		{
			__r__3 = 5}break
		case 1:
		{
			__r__3 = 6}break
		case 2:
		{
			__r__3 = 7}break
	}
	return __r__3{
		
		int* __r__3}
	}(self));
}
- (void) testEReg{
	
	EReg *ereg = [[EReg alloc] init:(NSMutableString*)@"ytrytrevev76" opt:(NSMutableString*)@"099"];
	
	NSMutableString *s = [ereg customReplace:(NSMutableString*)@"s" f:^(NSMutableString*):(EReg*)e{
		return (NSMutableString*)@"ss";
	}];
	BOOL b = [ereg match:(NSMutableString*)@"s"];
	s = [ereg matched:5];
	s = [ereg matchedLeft];
	id o = [ereg matchedPos];
	s = [ereg matchedRight];
	s = [ereg replace:(NSMutableString*)@"s" by:(NSMutableString*)@"by"];
	
	NSMutableArray *arr = [ereg split:(NSMutableString*)@","];
}
- (void) testHash{
	
	Hash *h = [[Hash alloc] init];
	[h set:(NSMutableString*)@"key" value:(NSMutableString*)@"value"];
	[h get:(NSMutableString*)@"key"];
	[h remove:(NSMutableString*)@"key"];
	BOOL b = [h exists:(NSMutableString*)@"key"];
	id arr = [h keys];
	id iter = [h iterator];
	
	NSMutableString *str = [h toString];
	
	IntHash *hi = [[IntHash alloc] init];
	[hi set:0 value:(NSMutableString*)@"value"];
	[hi get:0];
	[hi remove:0];
	BOOL bi = [hi exists:0];
	id arri = [hi keys];
	id iteri = [hi iterator];
	
	NSMutableString *stri = [hi toString];
}
- (void) testLambda{
	
	NSMutableArray *a = [Lambda array:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], nil]]];
	
	List *l = [Lambda concat:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], nil]] b:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]]];
}
- (void) testList{
	
	List *l = [[List alloc] init];
	[l add:2];
	[l push:18];
	
	List *l2 = [l filter:^(BOOL):(int)i{
		return i > 5;
	}];
	int item = [l first];
	BOOL empty = [l isEmpty];
	id iter = [l iterator];
	
	NSMutableString *s = [l join:(NSMutableString*)@", "];
	s = [l toString];
	item = [l last];
	item = [l pop];
	BOOL r = [l remove:5];
	[Log trace:l length infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"285",@"Tests",@"testList",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[l clear];
	[Log trace:l length infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"287",@"Tests",@"testList",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	
	List *newList = [l map:^(NSMutableString*):(int)i{
		return [Std string:i];
	}];
	
	FastList *fl = [[FastList alloc] init];
	fl.head = [[FastCell alloc] init:8 next:fl head];
}
- (void) testMath{
	float pi = M_PI;
	float max = -DBL_MAX;
	float min = DBL_MAX;
	float nan = NAN;
	float x = sqrtf(5);
	x = fabsf(5);
	x = fmaxf(5, 45555);
	x = fminf(5, 45555);
	x = sinf(5);
	x = cosf(5);
	x = atan2f(5, 3);
	x = tanf(5);
	x = expf(5);
	x = logf(5);
	x = sqrtf(5);
	int xr = roundf(5);
	xr = floorf(5);
	xr = ceilf(5);
	x = atanf(5);
	x = asinf(5);
	x = acosf(5);
	x = powf(5, 4);
	x = rand() * 5;
	BOOL b = isfinite(45454);
	b = isnan(45454);
	float j = x + xr;
	j += x;
	float k = ( (b) ? -x : x);
}
- (void) testReflect{
	id obj = struct {
	a:(NSMutableString*)@"aaaaa"
	} structName;
	BOOL b = [Reflect hasField:obj field:(NSMutableString*)@"a"];
	id f = [Reflect field:obj field:(NSMutableString*)@"a"];
	if (obj != nil) [obj __SetField-TDynamic-];
	[self __SetField-TDynamic-];
	id p = (id)[self __Field-TDynamic-];
	[Reflect callMethod:self func:self testStd args:[[NSMutableArray alloc] initWithObjects:, nil]]];
	[Reflect callMethod:self func:self callLotsOfArguments args:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], nil]]];
	
	NSMutableArray *fs = [Reflect fields:obj];
	BOOL isf = [Reflect isFunction:self testStd];
	int i = [Reflect compare:1 b:2];
	BOOL cm = [Reflect compareMethods:self testStd f2:self testString];
	BOOL isobj = [Reflect isObject:obj];
	isobj = [Reflect isObject:self testStd];
	[Reflect deleteField:obj f:(NSMutableString*)@"a"];
	id obj2 = [Reflect copy:obj];
}
- (void) testStd{
	int _int = 3;
	BOOL _BOOL = [Std is:self d1 t:float];
	float _float = [Std parseFloat:(NSMutableString*)@"55454.65"];
	_int = [Std parseInt:(NSMutableString*)@"435345.23"];
	_int = [Std random:543];
	
	NSMutableString *string = [Std string:_int];
}
- (void) testString{
	
	NSMutableString *string = [[NSMutableString alloc] init:(NSMutableString*)@"abcdefghijklmnopqrstuvwxyz"];
	int len = string.length;
	
	NSMutableString *s = [string characterAtIndex:5];
	int ch = [string characterAtIndex:5];
	int i = [string rangeOfString:(NSMutableString*)@"abc" startIndex:nil];
	int i1 = [string rangeOfString:(NSMutableString*)@"abc" startIndex:2];
	int li = [string rangeOfString options:NSBackwardsSearch:(NSMutableString*)@"abc" startIndex:nil];
	
	NSMutableArray *components = [string componentsSeparatedByString:(NSMutableString*)@"-"];
	
	NSMutableString *s2 = [string substringWithRange:5 len:nil];
	s2 = [string substringWithRange:5 len:len];
	s2 = [string substringWithRange:5 endIndex:nil];
	s2 = [string substringWithRange:1 endIndex:len];
	s2 = [string lowercaseString];
	s2 = [string uppercaseString];
	s2 = [string description];
	
	NSMutableString *s3 = (NSMutableString*)@"\t";
	
	StringBuf *buf = [[StringBuf alloc] init];
	[buf.b appendString:(NSMutableString*)@"abc"];
	[buf.b appendString:(NSMutableString*)@""];
	buf.b += [(NSMutableString*)@"abcdefghijklmnopqerstuvwxyz" substringWithRange:5 len:nil];
	buf.b += [(NSMutableString*)@"abcdefghijklmnopqerstuvwxyz" substringWithRange:5 len:10];
	
	NSMutableString *strbuf = buf.b;
	
	NSMutableString *st = [StringTools urlEncode:(NSMutableString*)@"http://imagin.ro/Gorgeous Elena/2"];
	st = [StringTools urlDecode:(NSMutableString*)@"http://imagin.ro/Gorgeous Elena/2"];
	st = [StringTools htmlEscape:(NSMutableString*)@"<a href= &>" quotes:nil];
	st = [StringTools htmlUnescape:(NSMutableString*)@"<a href= &>"];
	st = [StringTools ltrim:(NSMutableString*)@" abcdefgh"];
	st = [StringTools rtrim:(NSMutableString*)@"abcdefgh "];
	st = [StringTools trim:(NSMutableString*)@" abcdefgh "];
	st = [StringTools rpad:(NSMutableString*)@"abcdefgh" c:(NSMutableString*)@"0" l:10];
	st = [StringTools lpad:(NSMutableString*)@"abcdefgh" c:(NSMutableString*)@"0" l:10];
	st = [StringTools replace:(NSMutableString*)@"abcdefgh" sub:(NSMutableString*)@"abc" by:(NSMutableString*)@"_abc"];
	BOOL b = [StringTools startsWith:(NSMutableString*)@"abcdefg" start:(NSMutableString*)@"abc"];
	b = [StringTools endsWith:(NSMutableString*)@"abcdefg" end:(NSMutableString*)@"efg"];
	b = [StringTools isSpace:(NSMutableString*)@"abcdefg" pos:3];
	
	NSMutableString *i2 = [StringTools hex:345345 digits:10];
	
	NSMutableString *sfin = [strbuf stringByAppendingString:st];
	sfin = [[strbuf stringByAppendingString:st] stringByAppendingString:s2];
	[sfin appendString:(NSMutableString*)@"abc"];
	sfin = [[st stringByAppendingString:(NSMutableString*)@"abc"] stringByAppendingString:@"5"];
	sfin = [@"55" stringByAppendingString:(NSMutableString*)@"abc"];
}
- (void) testSys{
	[Sys print:(NSMutableString*)@"hello world"];
	[Sys println:(NSMutableString*)@"hello world"];
	
	NSMutableArray *arr = [Sys args];
	int _int = [Sys command:(NSMutableString*)@"cd" args:[[NSMutableArray alloc] initWithObjects:(NSMutableString*)@"~", nil]]];
	_int = [Sys command:(NSMutableString*)@"ls" args:[[NSMutableArray alloc] initWithObjects:, nil]]];
	float _float = [Sys cpuTime];
	
	Hash *hash = [Sys environment];
	
	NSMutableString *string = [Sys executablePath];
	[Sys exit:0];
	_int = [Sys getChar:YES];
	string = [Sys getCwd];
	string = [Sys getEnv:(NSMutableString*)@"VAR1"];
	[Sys putEnv:(NSMutableString*)@"VAR1" v:(NSMutableString*)@"val 1"];
	[Sys setCwd:(NSMutableString*)@"thisdir"];
	BOOL bool = [Sys setTimeLocale:(NSMutableString*)@"loc"];
	[Sys sleep:5.5];
	
	Output *_out = [Sys stderr];
	
	Input *_in = [Sys stdin];
	_out = [Sys stdout];
	string = [Sys systemName];
	_float = [Sys time];
}
- (void) testType{
	
	Class *sup = [Type getSuperClass:NSString];
	
	NSMutableString *sups = [Type getClassName:NSString];
	
	Class *cl = [Type resolveClass:(NSMutableString*)@"ios.map.MKMapView"];
}
- (void) testXml{
}
- (void) testTimer{
	
	NSMutableArray *_g = [[NSMutableArray alloc] initWithObjects:self, nil]];
	
	Timer *timer = [[Timer alloc] init:50];
	timer.run = self.testXml;
	[timer stop];
	timer = [Timer delay:self testTimer time_ms:50];
	timer = [Timer delay:^(void){
		[[_g objectAtIndex:0] testTimer];
	} time_ms:50];
	[Timer measure:self testTimer pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"519",@"Tests",@"testTimer",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	float f = [Timer stamp];
}
- (void) testFrameworksImport{
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
- (void) callLotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
	[self optionalArguments:0 arg2:1 arg3:2 arg4:nil];
	[self optionalArguments1:0 arg2:1 arg3:2 arg4:nil];
	[self optionalArguments2:0 arg2:nil arg3:nil arg4:3];
	[self optionalArguments3:0 arg2:1 arg3:nil arg4:nil];
}
- (void) optionalArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
	if (arg4==nil) arg4=nil;
}
- (void) optionalArguments1:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
	if (arg4==nil) arg4=5;
}
- (void) optionalArguments2:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
	if (arg3==nil) arg3=nil;
	if (arg2==nil) arg2=nil;
}
- (void) optionalArguments3:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(BOOL)arg4{
	if (arg4==nil) arg4=nil;
	if (arg2==nil) arg2=6;
	if (arg3==nil) arg3=nil;
}
- (void) init{
	int x = 6;
	self.s = (NSMutableString*)@"init";
}
- (void) printHello{
	[Log trace:(NSMutableString*)@"Hello from Haxe Objective-C" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"570",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
- (id) init{
	self = [super init];
	self.s = (NSMutableString*)@"str";
	self.d2 = 4.5;
	self.d1 = 34;
	return self;
}

@end

@implementation Tests2

@synthesize d1;
- (void) methodInTests2{
}
- (id) init{
	self = [super init];
	self.d1 = 34;
	
	NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:self.d1, self.d1, [NSNumber numberWithInt:50], nil]];
	return self;
}

@end
