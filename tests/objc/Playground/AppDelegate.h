//
//  AppDelegate.h
//  Playground
//
//  Created by Baluta Cristian on 03/01/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIWebViewDelegate>{

id self_c;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) int length;

@end

@interface Tests2 : NSObject

@property (nonatomic) int d1;
@property (nonatomic,copy) void(^block1)();
@property (nonatomic,copy) void(^block2)(int);
@property (nonatomic,copy) void(^block3)(NSString*);
@property (nonatomic,copy) NSString*(^block4)(NSString*);

- (void) callBlock;
- (void) redefineThisMethod;
- (id) init;
-(void)ttt;
-(void)ttt2:(NSString*)str;
- (void)login;

@end