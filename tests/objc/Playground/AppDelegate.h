//
//  AppDelegate.h
//  Playground
//
//  Created by Baluta Cristian on 03/01/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) int length;

@end

@interface Tests2 : NSObject

@property (nonatomic) int d1;
@property (nonatomic,copy) void(^block1)(void);
- (void) methodInTests2;
- (void) redefineThisMethod;
- (id) init;

@end