//
//  HXObject.h
//  Playground
//
//  Created by Baluta Cristian on 22/01/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXObject extends NSObject{
	NSMutableDictionary *dict;
}
-(void) setVariableNamed:(id)key val:(id)val;
-(id) getVariableNamed:(id)key;

@end
