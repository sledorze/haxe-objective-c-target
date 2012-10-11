//
// File generated with the Haxe Objective-C target.
//
#import objc.ios.UIWebView
#import haxe.Log
	public class Test {
		-  (NSNumber) setWidthv:(NSNumber*)v{
			return [NSNumber numberWithInt:0];
		}
		
		-  (NSNumber) getWidth{
			return [NSNumber numberWithInt:0];
		}
		
		-  (NSNumber) functionHeaderWithParamsc:(BOOL*)c abc:(NSNumber*)abc def:(NSNumber*)def ghi:(NSString*)ghi{
			return ((c)?[NSNumber numberWithInt:1]:[NSNumber numberWithInt:0]);
		}
		
		-  function get width() : NSNumber { return getWidth(); }
		-  function set width( __v : NSNumber ) : void { setWidth(__v); }
		protected var $width : NSNumber;
		-  var float1 : NSNumber;
		+  (void) main{
			haxe.Log._trace(@"Hello world from Haxe sources",{ fileName : @"Test.hx", lineNumber : [NSNumber numberWithInt:9], className : @"Test", methodName : @"main"});
			var a : NSMutableArray = new NSMutableArray();
			var aa : NSMutableArray = [[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5]];
			var b : NSNumber = [NSNumber numberWithInt:5];
			var c : NSNumber = 5.0;
			var d : NSString = @"abcdefghijkl";
			var e : BOOL = YES;
			var f : NSNumber;
			var webView : objc.ios.UIWebView = new objc.ios.UIWebView();
			webView.initWithFrame();
			{
				var _g : NSNumber = [NSNumber numberWithInt:0];
				while(_g < aa.length) {
					var i : NSNumber = aa[_g];
					++_g;
					a.push(Std.string(i));
				}
			}
		}
		
	}
}
