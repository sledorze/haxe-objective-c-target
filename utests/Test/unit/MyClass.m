//
//  MyClass
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/MyClass.h"

@implementation MyClass

@synthesize val;
@synthesize ref;
@synthesize intValue;
@synthesize stringValue;
- (int) get{
	return self.val;
}
- (void) set:(int)v{
	self.val = v;
}
- (int) add:(int)x y:(int)y{
	return self.val + x + y;
}
- (id) init:(int)v{
	self = [super init];
	self.val = v;
	self.intValue = 55;
	return self;
}

@end

@implementation MyParent

- (int) a{
	return 11;
}
- (int) b{
	return 20;
}
- (id) init{
	self = [super init];
	return self;
}

@end

@implementation MyChild1

- (int) a{
	return 12;
}
- (int) b{
	return 21;
}
- (int) c{
	return 19;
}
- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation MyChild2

- (int) test1:(MyChild1*)mc1{
	return [mc1 b];
}
- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation Base

@synthesize s;
- (id) init{
	self = [super init];
	return self;
}

@end

@implementation Child1

- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation Child2

- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation Child2_1

- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation Unrelated

@synthesize s;
@synthesize t;
- (id) init{
	self = [super init];
	return self;
}

@end

@implementation ClassI2

- (id) init{
	self = [super init];
	return self;
}

@end

@implementation CI1

- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation CI2

- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation CII1

- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation CII2

- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation PClassBase

- (id) init{
	self = [super init];
	return self;
}

@end

@implementation PClass1

- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation PClass2

- (id) init:(id)t{
	self = [super init];
	[super];
	return self;
}

@end

@implementation Cov1

- (Base*) covariant{
	return [[Base alloc] init];
}
- (id) init{
	self = [super init];
	return self;
}

@end

@implementation Cov2

- (Base*) covariant{
	return [[Child1 alloc] init];
}
- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation Cov3

- (Base*) covariant{
	return [[Child2_1 alloc] init];
}
- (id) init{
	self = [super init];
	return self;
}

@end

@implementation Ctrv1

- (void) contravariant:(Child1*)arg{
}
- (id) init{
	self = [super init];
	return self;
}

@end

@implementation Ctrv2

- (void) contravariant:(Child1*)_tmp_arg{
	
	Base *arg = (Base*)_tmp_arg;
}
- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation InitBase

+ (int) si:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 2; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) sop:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 27; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (id) st:(id)val {
	static id _val;
	if (val == nil) { if (_val == nil) _val = NSMutableString; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) sp:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 6; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (float) sinline:(float)val {
	static float _val;
	if (val == nil) { if (_val == nil) _val = 60000.; }
	else { if (_val != nil) _val = val; }
	return _val;
}
@synthesize i;
@synthesize s;
@synthesize b;
@synthesize t;
- (id) init{
	self = [super init];
	self.t = NSMutableString;
	self.b = YES;
	self.s = (NSMutableString*)@"foo";
	self.i = 2;
	return self;
}

@end

@implementation InitChild

- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation InitChildWithCtor

- (id) init:(id)_{
	self = [super init];
	[super];
	return self;
}

@end

@implementation InitWithoutCtor

@synthesize i;
- (id) init{
	self = [super init];
	self.i = 2;
	return self;
}

@end

@implementation InitProperties

@synthesize accNull;
@synthesize accDefault;

@synthesize accNever;

- (int) set_accFunc:(int)v{
	return ((int)($this:(snd ctx.path)) @throw (NSMutableString*)@"setter was called";
	return __r__{
		
		int* __r__}
	}(self));
}
- (id) set_accDynamic:(id)v{
	return ((id)($this:(snd ctx.path)) @throw (NSMutableString*)@"setter was called";
	return __r__{
		
		id* __r__}
	}(self));
}
- (id) init{
	self = [super init];
	self.accDynamic = 3;
	self.accNever = 3;
	self.accFunc = 3;
	self.accDefault = 3;
	self.accNull = 3;
	return self;
}

@end

@implementation ParamConstraintsClass

+ (id) staticSingle:(id)a{
	return a;
}
- (id) memberSingle:(id)a{
	return a;
}
- (id) memberMultiple:(id)a{
	return a;
}
- (id) memberComplex:(id)a b:(id)b{
	return b;
}
- (id) memberBasic:(id)a b:(id)b{
	return [b objectAtIndex:0];
}
- (float) memberAnon:(id)v{
	return v.x + v.y;
}
- (void) memberOverload:(NSMutableString*)a b:(NSMutableString*)b{
}
- (id) init{
	self = [super init];
	return self;
}

@end

@implementation ParamConstraintsClass2

- (void) bind:(id)t{
}
- (void) check:(id)a{
}
- (id) init{
	self = [super init];
	return self;
}

@end

@implementation UsingBase

+ (NSMutableString*) privFunc:(NSMutableString*)s{
	return [s uppercaseString];
}
+ (NSMutableString*) pupFunc:(NSMutableString*)s{
	return [s uppercaseString];
}

@end

@implementation UsingChild1

+ (NSMutableString*) test{
	return [UsingBase pupFunc:(NSMutableString*)@"foo"] + [UsingBase privFunc:(NSMutableString*)@"foo"] + [UsingChild2 siblingFunc:(NSMutableString*)@"FOO"];
}
+ (NSMutableString*) siblingFunc:(NSMutableString*)s{
	return [s lowercaseString];
}

@end

@implementation UsingChild2

+ (NSMutableString*) test{
	return [UsingChild2 siblingFunc:(NSMutableString*)@"foo"];
}
+ (NSMutableString*) siblingFunc:(NSMutableString*)s{
	return [s uppercaseString];
}

@end

@implementation UsingUnrelated

+ (NSMutableString*) test{
	return [UsingBase pupFunc:(NSMutableString*)@"foo"] + [UsingChild2 siblingFunc:(NSMutableString*)@"foo"];
}

@end

@implementation VarProps



+ (int) get_SX{
	return 1;
}
+ (int) set_SX:(int)v{
	return v;
}
+ (int) get_SY{
	return VarProps.SY;
}
+ (int) set_SY:(int)v{
	VarProps.SY = v;
	return v;
}



- (int) get_x{
	return 1;
}
- (int) set_x:(int)v{
	return v;
}
- (int) get_y{
	return self.y;
}
- (int) set_y:(int)v{
	self.y = v;
	return v;
}
- (int) set_z:(int)v{
	self.z = v + 1;
	return self.z;
}
- (id) init{
	self = [super init];
	[self set_x:1];
	[self set_y:2];
	[self set_z:3];
	return self;
}

@end

@implementation BaseSuperProp



- (int) get_prop{
	return 1;
}
- (int) set_prop:(int)v{
	return v;
}
- (SEL) get_fProp{
	return ^- (NSMutableString*) :(int)i{
		return [(NSMutableString*)@"test" stringByAppendingString:i];
	}
}
- (id) init{
	self = [super init];
	return self;
}

@end

@implementation ChildSuperProp

- (int) get_prop{
	return [super get_prop] + 1;
}
- (int) set_prop:(int)v{
	return [super set_prop:v] + 1;
}
- (SEL) get_fProp{
	
	NSMutableArray *s = [[NSMutableArray alloc] initWithObjects:[[super get_fProp]:[NSNumber numberWithInt:0]], nil];
	return ^- (NSMutableString*) :(int)i{
		return [s objectAtIndex:0] + i;
	}
}
- (NSMutableString*) test{
	return [[super get_fProp]:2];
}
- (id) init{
	self = [super init];
	[super];
	return self;
}

@end

@implementation InlineCastA

- (InlineCastA*) self{
	return self;
}

@end

@implementation InlineCastB

- (InlineCastB*) test{
	return (InlineCastB*)[self _self];
}
- (NSMutableString*) quote{
	return (NSMutableString*)@"I am the greatest.";
}
- (id) init{
	self = [super init];
	return self;
}

@end
