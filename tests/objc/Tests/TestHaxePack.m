//
//  TestHaxePack
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "TestHaxePack.h"

@implementation TestHaxePack

- (void) testTimer{
	
	NSMutableArray *_g = [[NSMutableArray alloc] initWithObjects:self, nil];
	
	Timer *timer = [[Timer alloc] init:50];
	timer.run = -FClosure-^(){ [self testTimerLoop]; };
	[timer stop];
	timer = [Timer delay:-FClosure-^(){ [self testTimerLoop]; } time_ms:50];
	timer = [Timer delay:^- (void) {
		[[_g objectAtIndex:0] testTimerLoop];
	} time_ms:50];
	[Timer measure:self.testTimerLoop pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestHaxePack.hx",@"22",@"TestHaxePack",@"testTimer",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	float f = [Timer stamp];
}
- (void) testTimerLoop{
}
- (void) testCrypto{
	
	NSMutableString *str1 = [Md5 encode:(NSMutableString*)@"Hello world"];
	
	NSMutableString *str2 = [Sha1 encode:(NSMutableString*)@"Hello world"];
}
- (void) testResources{
	
	NSMutableString *str = [Resource getString:(NSMutableString*)@"welcome"];
	[Log trace:str infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestHaxePack.hx",@"39",@"TestHaxePack",@"testResources",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
- (void) testCallstack{
	
	NSMutableArray *arr = (NSMutableArray*)[CallStack callStack];
}
- (void) testSerialization{
	
	NSMutableString *str = [Serializer run:struct {
	a:(NSMutableString*)@"a"
	} structName];
	id obj = [Unserializer run:str];
}
- (id) init{
	self = [super init];
	
	NSMutableString *str = [Json stringify:struct {
	a:(NSMutableString*)@"a"
	} structName replacer:nil];
	id obj = [Json parse:str];
	
	Template *t = [[Template alloc] init:str];
	return self;
}

@end
