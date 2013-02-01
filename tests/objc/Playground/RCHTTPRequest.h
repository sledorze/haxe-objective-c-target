//
//  LoadAndParseXml.h
//  IMAGIN
//
//  Created by Baluta Cristian on 5/9/10.
//  Copyright 2010 ralcr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CFNetwork/CFNetwork.h>


@interface RCHttpRequest : NSObject {
	
	id delegate;
	NSString *URL;
	NSURLConnection *connection;
	
	NSString *result; // Received data after it completes
	NSMutableData *receivedData; // Received data in steps
}

@property (nonatomic, readonly) NSString *result;
@property (nonatomic, readonly) NSMutableData *receivedData;


- (id)initWithURL:(NSString*)u delegate:(id)d;

- (void)call:(NSString*)script variables:(NSDictionary*)dict method:(NSString*)method;

- (void)onRCHttpProgress;
- (void)onRCHttpComplete;
- (void)onRCHttpError;
- (void)onHTTPConnectionError;

- (void)downloadStarted;
- (void)downloadEnded;

@end
