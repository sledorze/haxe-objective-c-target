//
//  HXObject.m
//  Playground
//
//  Created by Baluta Cristian on 22/01/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import "HXObject.h"
#import <objc/runtime.h>

@implementation HXObject


-(id) init{
	self = [super init];
	dict = [[NSMutableDictionary alloc] init];
	return self;
}
-(void) setVariableNamed:(id)key val:(id)val{
    // set
    //objc_setAssociatedObject(self, &key, val, OBJC_ASSOCIATION_RETAIN);
	[dict setValue:val forKey:key];
}
-(id) getVariableNamed:(id)key {
    // get
    //return objc_getAssociatedObject(self, &key);
	return [dict valueForKey:key];
}
@end
