//
//  AppDelegate.m
//  Playground
//
//  Created by Baluta Cristian on 03/01/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//
typedef void (*FunctionType)();
typedef void (*FunctionType2)(const char);
typedef void (*FunctionType3)(int);

@interface WebViewDelegate : NSObject <UIWebViewDelegate>

@property (nonatomic) FunctionType loadFinished;
@property (nonatomic) FunctionType2 callString;
@property (nonatomic) FunctionType3 callInt;

@end


@implementation WebViewDelegate
@synthesize loadFinished;

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	//NSLog(@"load complete at url %@", webView.request.URL);
	loadFinished();
	//callString("Http://imagin.ro");
	//callInt(0);
}

@end



#import "AppDelegate.h"
#import "Date.h"
#import "Std.h"
#import <objc/runtime.h>
#import "RCHTTPRequest.h"

@implementation AppDelegate
id me;
char fooKey;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
//	NSLog(@"%i", self.length);
//	self.length = 5;
//	NSLog(@"%i", self.length);
//	self.length += 5;
//	NSLog(@"%i", self.length);
	int iii = 555;
	int i = 666;
	NSLog(@"%i", [Std random:100]);
	NSLog(@"%i", [Std random:100]);
//	NSLog(@"%@", [Std string:self]);
//	NSLog(@"%i", [Std parseInt:(NSMutableString*)@"5425345.3"]);
//	NSLog(@"%2f", [Std parseFloat:(NSMutableString*)@"5425345.3"]);
//	NSLog(@"%i", [Std int:54.53]);
//	
//	NSDate *date = [NSDate now];
//	NSLog(@"%@", date);
//	NSDate *date2 = [NSDate fromTime:1000000000];
//	NSLog(@"%@", date2);
//	NSDate *date3 = [NSDate fromString:(NSMutableString*)@"2013-02-18 15:34:50"];
//	NSLog(@"%@", date3);
//	NSLog(@"%@", [date toString]);
	
	//[self callThis:@selector(func)];
	//[self callBlock:^(){ NSLog(@"Block was called"); }];
	
	me = self;
	
	// redefine a method
	Tests2 *test2 = [[Tests2 alloc] init];
	test2.block1 = block_block1;
	test2.block2 = block_block2;
	test2.block3 = ^(NSString*str){ NSLog(@"block3 called %@", str); [self login]; };
	test2.block4 = ^(NSString*str){ NSLog(@"block4 called %@", str); return @"block 4 called inline"; };
	[test2 callBlocks];
	
	// Redefine a method approach 2
	self_c = self;
//	WebViewDelegate *w = [[WebViewDelegate alloc] init];
//	w.loadFinished = &ttt;
//	w.callString = &ttt2;
//	[w webViewDidFinishLoad:nil];
	
	UIButton *loginB = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 100, 30)];
	[loginB setTitle:@"Login" forState:UIControlStateNormal];// titleLabel.text = @"Login";//[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
	[loginB addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
	[self.window addSubview:loginB];
	
	UIButton *logoutB = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 100, 30)];
	[logoutB setTitle:@"Logout" forState:UIControlStateNormal];// titleLabel.text = @"Login";//[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
	[logoutB addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
	[self.window addSubview:logoutB];
	
//	static const char * const defaultVtable[] = {
//		"allocWithZone:",
//		"alloc",
//		"class",
//		"self",
//		"isKindOfClass:",
//		"respondsToSelector:",
//		"isFlipped",
//		"length",
//		"objectForKey:",
//		"count",
//		"objectAtIndex:",
//		"isEqualToString:",
//		"isEqual:",
//		"retain",
//		"release",
//		"autorelease",
//	};
//	CFArrayRef arr = CFArrayCreate(NULL, (NSArray)*defaultVtable, 16, NULL);
//	
//	NSLog(@"%@", arr);
	
	
	
	
	id e = [[NSObject alloc] init];
	
    // set
    //object_setInstanceVariable(e, "dynvar", (__bridge void *)([NSNumber numberWithInt:10908]));
	
    // get
    NSNumber *associatedObject = objc_getAssociatedObject(e, &fooKey);
    NSLog(@"associatedObject: %@", associatedObject);
	
	self.window.backgroundColor = [UIColor grayColor];
	
	UIActivityIndicatorViewStyle stl = UIActivityIndicatorViewStyleWhiteLarge;
	UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:stl];
	CGRect rect = activityIndicator.frame;
	rect.origin.x = 0 - rect.size.width/2;
	rect.origin.y = 20 - rect.size.height/2;
	activityIndicator.frame = rect;
	
	[[[UIApplication sharedApplication] keyWindow] addSubview:activityIndicator];
	
	[activityIndicator startAnimating];
	
    return YES;
}

void(^block_block1)(void) = ^{ NSLog(@"block_block1 block_block1 block_block1"); };
void(^block_block2)(int i) = ^(int i){ NSLog(@"block_block2 block_block2 block_block2 called %i", i); /*[me login];*/ };
//void(^block_block22)(int i, id self) = ^(int i, id self){ NSLog(@"block_block2 block_block2 block_block2 called %i", i); [self login]; };



//void ttt () {
//	NSLog(@"c method called");
//	[self_c ttt];
//}
//-(void)ttt{
//	NSLog(@"objc method called");
//}
//void ttt2 (const char str) {
//	NSLog(@"c method 2 called");
//	[self_c ttt2:[[NSString alloc] initWithUTF8String:&str]];
//}
//// Very important, this function must be defined in the interface otherwise the call from C function will not work
//-(void)ttt2:(NSString*)str{
//	NSLog(@"objc method 2 called : %@", str);
//}


- (void)login{
	NSLog(@"login");
	UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 80, 320, 500)];
	webView.delegate = self;
	NSURL *url = [[NSURL alloc] initWithString:@"https://graph.facebook.com/oauth/authorize?client_id=456093077787894&redirect_uri=http://www.facebook.com/connect/login_success.html&display=touch&response_type=token"];
	NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
	[webView loadRequest:req];
	[self.window addSubview:webView];
}
-(void)logout {
	NSLog(@"logout");
	NSString *str2 = [NSString stringWithFormat:@"https://graph.facebook.com/oauth/authorize_cancel?client_id=456093077787894&redirect_uri=&access_token=%@", token];
	NSURL *url2 = [[NSURL alloc] initWithString:str2];
	NSString *str = [NSString stringWithFormat:@"https://m.facebook.com/logout.php?next=&confirm=1&access_token=%@", token];
	NSURL *url = [[NSURL alloc] initWithString:str];
	NSURLRequest *req = [NSURLRequest requestWithURL:url2];
	NSLog(@"logout %@", str);
	
	UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 80, 320, 500)];
	//webView.delegate = self;
	[webView loadRequest:req];
	[self.window addSubview:webView];
	
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //[receivingData appendData:data];
    //the received data is added to receivingData
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSLog(@"done logout");
   // NSString *str = [[NSString alloc] initWithData:receivingData encoding:NSUTF8StringEncoding];
    //We make the data a string
    //receivedData = [NSMutableArray arrayWithArray:[str componentsSeparatedByString:@"\n"]];
    //receivedData now has an array with every line of the request
    //You could do something with the data here, store it, or send it to another function
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
	NSLog(@"load complete at url %@", webView.request.URL);
	//[webView.request.URL.absoluteString cStringUsingEncoding:NSUTF8StringEncoding];
	
	NSArray *arr = [webView.request.URL.absoluteString componentsSeparatedByString:@"access_token="];
	NSArray *arr2 = [[arr lastObject] componentsSeparatedByString:@"&"];
	token = [arr2 objectAtIndex:0];
	NSLog(@"token = %@", token);
	webView.delegate = nil;
	
//	NSString *str = [NSString stringWithFormat:@"https://graph.facebook.com/me/friends?access_token=%@", token];
//	NSURL *url = [[NSURL alloc] initWithString:str];
//	NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
//	[webView loadRequest:req];
	
	
	NSArray *keys = [NSArray arrayWithObjects:@"access_token",@"app_secret", @"message", nil];
	NSArray *objects = [NSArray arrayWithObjects:token, @"7a779b67a3182aece3675e9c81fc41de", @"messagegegegege", nil];
	NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	
//	RCHttpRequest *req = [[RCHttpRequest alloc] initWithURL:@"https://graph.facebook.com/me/friends" delegate:nil];
//	RCHttpRequest *req = [[RCHttpRequest alloc] initWithURL:@"https://graph.facebook.com/me/feed" delegate:nil];
	RCHttpRequest *req = [[RCHttpRequest alloc] initWithURL:[NSString stringWithFormat:@"https://graph.facebook.com/me/friends?access_token=%@", token] delegate:nil];
	//RCHttpRequest *req = [[RCHttpRequest alloc] initWithURL:@"http://ralcr.com/insert.php?" delegate:nil];
	[req call:@"" variables:dictionary method:@"GET"];
}

- (void) callThis:(SEL)sel {
	[self performSelector:sel];
}
//- (void) callBlock:(void)(^sel) {
//	//[self performSelector:sel];
//	sel();
//}
- (void) func {
	NSLog(@"block1 was called");
}



static int length__;
- (int) length{
	return length__;
}
- (void) setLength:(int)val{
	length__ = val;
}


@end



@implementation Tests2 {
	int gender;
	struct features *appearance;
@private
	int age;
	char *evaluation;
@protected
	id job;
	float wage;
@public
	id boss;
}

@synthesize d1;
@synthesize block1;
@synthesize block2;
@synthesize block3;
@synthesize block4;

- (void) callBlocks{
	NSLog(@"callBlock is calling block1 : %@", block1);
	block1();
	block2(0);
	block3(@"dgdcgdfgcgcgdfg");
	block4(@"block 4 called");
	
	NSLog(@"%@",[NSThread callStackSymbols]);
}
- (void) redefineThisMethod{
}
- (id) init{
	self = [super init];
	self.d1 = 34;
	
	self.block1 = ^(){ [self _block1]; };
	
	//NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:self.d1, self.d1, [NSNumber numberWithInt:50], nil];
	return self;
}
-(void)_block1{
	NSLog(@"block1default was called");
}
- makeIdenticalTwin {
	Tests2 *twin = [[Tests2 alloc] init];
	twin->gender = gender;
	twin->appearance = appearance;
	return twin;
}

@end

