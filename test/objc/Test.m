//
// File generated with the Haxe Objective-C target.
//
#import objc.ios.UIWebView
#import haxe.Log
#import flash.Boot

#import "Test.h"

@implementation Test
;
		-  (void) Test{ if( !flash.Boot.skip_constructor ) {
			super();
		}}
		
		+  (void) main{
			var a : NSMutableArray = new NSMutableArray();
			var aa : NSMutableArray = [[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5]];
			var b : NSNumber = [NSNumber numberWithInt:5];
			var c : NSNumber = 5.0;
			var d : NSString = @"abcdefghijkl";
			var e : BOOL = YES;
			var f : NSNumber;
			{
				var _g : NSNumber = [NSNumber numberWithInt:0];
				while(_g < aa.length) {
					var i : NSNumber = aa[_g];
					++_g;
					a.push(Std.string(i));
				}
			}
			var webView : objc.ios.UIWebView = new objc.ios.UIWebView();
			webView.initWithFrame();
		}
		
		-  (void) printHello{
			haxe.Log._trace(@"Hello from Haxe Objective-C",{ fileName : @"Test.hx", lineNumber : [NSNumber numberWithInt:40], className : @"Test", methodName : @"printHello"});
		}
		
		-  (NSNumber) adda:(NSNumber*)a b:(NSNumber*)b{
			return a + b;
		}
		
		-  (NSNumber) setWidthv:(NSNumber*)v{
			return [NSNumber numberWithInt:0];
		}
		
		-  (NSNumber) getWidth{
			return [NSNumber numberWithInt:0];
		}
		
		-  function get width() : NSNumber { return getWidth(); }
		-  function set width( __v : NSNumber ) : void { setWidth(__v); }
		protected var $width : NSNumber;
		-  var interfaceVar2 : NSNumber;
		-  var interfaceVar1 : NSNumber;
@end;
