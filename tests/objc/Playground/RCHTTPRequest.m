//
//  RCHttp.m
//  IMAGIN
//
//  Created by Baluta Cristian on 5/9/10.
//  Copyright 2010 ralcr. All rights reserved.
//

#import "RCHttpRequest.h"


@implementation RCHttpRequest
@synthesize receivedData, result;


- (id)initWithURL:(NSString*)u delegate:(id)d {
	
	if (self = [super init]) {
		URL = u;
		delegate = d;
	}
	return self;
}




- (void)call:(NSString*)script variables:(NSDictionary*)dictionary method:(NSString*)method {
	
	if ([method isEqualToString:@"GET"]) {
		
		NSURLRequest *request = [[NSURLRequest alloc]
								 initWithURL: [NSURL URLWithString:URL]
								 cachePolicy: NSURLRequestReloadIgnoringLocalCacheData
								 timeoutInterval: 10];
		
        [self download:request];
		return;
	}
	
	// Create POST variables
	NSMutableString *postStr = [[NSMutableString alloc] init];
	
	for (id key in dictionary) {
		//NSLog(@"RCHttp append key: %@, value: %@", key, [dictionary objectForKey:key]);
		[postStr appendFormat:@"%@=%@&", key, [dictionary objectForKey:key]];
	}
	
    NSData *postData = [postStr dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	//NSLog(@"RCHttp scriptsPath: %@", scriptsPath);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
	
	[self download:request];
}




- (void)download:(NSURLRequest *)request {
	NSLog(@"HTTPReqest startDownload");
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    // Test the validity of the connection object.
    NSAssert (connection != nil, @"Failure to create URL connection.");
}





#pragma mark NSURLConnection delegate methods

- (void)connection:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"RCHttp didReceiveResponse");
	receivedData = [NSMutableData data];
}

// Called when a chunk of data has been downloaded.
- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data {
    //NSLog(@"RCHttp didReceiveData");
	[receivedData appendData:data];
	//NSLog(@"RCHttp didReceiveData with %d bytes", [receivedData length]);
	
//	[self performSelectorOnMainThread:@selector(onRCHttpProgress) 
//                           withObject:nil 
//                        waitUntilDone:NO];
}
/*- (NSURLRequest *)connection: (NSURLConnection *)inConnection
             willSendRequest: (NSURLRequest *)inRequest
            redirectResponse: (NSURLResponse *)inRedirectResponse;
{
    NSLog(@"redirectResponse %@", inRedirectResponse);
	return inRequest;
//	if (inRedirectResponse) {
//        NSMutableURLRequest *r = [[request mutableCopy] autorelease]; // original request
//        [r setURL: [inRequest URL]];
//        return r;
//    } else {
//        return inRequest;
//    }
}*/

- (void)connectionDidFinishLoading:(NSURLConnection *)conn {
    
    result = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
	NSLog(@"RCHttp connectionDidFinishLoading %@", result);
//	[self performSelectorOnMainThread:@selector(onRCHttpComplete) 
//                           withObject:nil 
//                        waitUntilDone:NO];
}

// Forward errors to the delegate.
- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error {
    
	if ([error code] == kCFURLErrorNotConnectedToInternet) {
		NSLog(@"HTTPRequst connection didFail - not connected to the internet");
        // If we can identify the error, we can present a more precise message to the user.
//        [self performSelectorOnMainThread:@selector(onHTTPConnectionError) 
//                               withObject:nil
//							waitUntilDone:NO];
    }
	else {
		NSLog(@"HTTPRequst connection didFail - url not found");
        // otherwise handle the error generically
//        [self performSelectorOnMainThread:@selector(onRCHttpError)
//                               withObject:nil
//							waitUntilDone:NO];
    }
}

// Disable caching so that each time we run this app we are starting with a clean slate.
- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
				  willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
    return nil;
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
	return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
		[challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
	
	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}




#pragma mark Delegate stuff

- (void) onRCHttpProgress {
	if ([delegate respondsToSelector:@selector(onRCHttpProgress:)])
		[delegate performSelector:@selector(onRCHttpProgress:) withObject:self];
}
- (void) onRCHttpComplete {
	NSLog(@"onRCHttpComplete %@", result);
	if ([delegate respondsToSelector:@selector(onRCHttpComplete:)])
		[delegate performSelector:@selector(onRCHttpComplete:) withObject:result];
}
- (void) onRCHttpError {
	NSLog(@"onRCHttpError");
	if ([delegate respondsToSelector:@selector(onRCHttpError)])
		[delegate performSelector:@selector(onRCHttpError)];
}
- (void) onHTTPConnectionError {
	NSLog(@"onRCHttpError");
	if ([delegate respondsToSelector:@selector(onHTTPConnectionError)])
		[delegate performSelector:@selector(onHTTPConnectionError)];
}



- (void) downloadStarted {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void) downloadEnded {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


@end
