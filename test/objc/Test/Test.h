
#import <UIKit/UIKit.h>


@interface Test : UIWebView <Interface2, TestInterface>


+ (void) main;

- (void) printHello;

- (NSNumber*) minusa:(NSNumber*)a b:(NSNumber*)b;

- (NSNumber*) adda:(NSNumber*)a b:(NSNumber*)b;

- (NSNumber*) setWidthv:(NSNumber*)v;

- (NSNumber*) getWidth;

@property (nonatomic, strong) NSNumber *width;




@end
