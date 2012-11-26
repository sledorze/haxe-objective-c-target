#import "StringTools.h"

@implementation StringTools

+ (NSMutableString*) urlEncode:(NSMutableString*)s{
	return [s stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}
+ (NSMutableString*) urlDecode:(NSMutableString*)s{
	return [s stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
+ (NSMutableString*) htmlEscape:(NSMutableString*)s{
	return [[[[[[s componentsSeparatedByString:@"&"].join:@"&amp;"] componentsSeparatedByString:@"<"].join:@"&lt;"] componentsSeparatedByString:@">"].join:@"&gt;"];
}
+ (NSMutableString*) htmlUnescape:(NSMutableString*)s{
	return [[[[[[s componentsSeparatedByString:@"&gt;"].join:@">"] componentsSeparatedByString:@"&lt;"].join:@"<"] componentsSeparatedByString:@"&amp;"].join:@"&"];
}
+ (BOOL) startsWith:(NSMutableString*)s start:(NSMutableString*)start{
	return slength >= startlength && [s substringWithRange:0 len:startlength] == start;
}
+ (BOOL) endsWith:(NSMutableString*)s end:(NSMutableString*)end{
	int elen = endlength;
	int slen = slength;
	return slen >= elen && [s substringWithRange:slen - elen len:elen] == end;
}
+ (BOOL) isSpace:(NSMutableString*)s pos:(int)pos{
	id c = [s characterAtIndex:pos];
	return c >= 9 && c <= 13 || c == 32;
}
+ (NSMutableString*) ltrim:(NSMutableString*)s{
	int l = slength;
	int r = 0;
	while (r < l && [StringTools isSpace:s pos:r]) r++;
	if (r > 0) return [s substringWithRange:r len:l - r];
	else return s;
	return nil;
}
+ (NSMutableString*) rtrim:(NSMutableString*)s{
	int l = slength;
	int r = 0;
	while (r < l && [StringTools isSpace:s pos:l - r - 1]) r++;
	if (r > 0) return [s substringWithRange:0 len:l - r];
	else return s;
	return nil;
}
+ (NSMutableString*) trim:(NSMutableString*)s{
	return [StringTools ltrim:[StringTools rtrim:s]];
}
+ (NSMutableString*) rpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l{
	int sl = slength;
	int cl = clength;
	while (sl < l) if (l - sl < cl) {
		s += [c substringWithRange:0 len:l - sl];
		sl = l;
	};
	else {
		s += c;
		sl += cl;
	}
	return s;
}
+ (NSMutableString*) lpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l{
	
	NSMutableString *ns = @"";
	int sl = slength;
	if (sl >= l) return s;;
	int cl = clength;
	while (sl < l) if (l - sl < cl) {
		[ns appendString:[c substringWithRange:@"0" len:l - sl]];
		sl = l;
	};
	else {
		[ns appendString:c];
		sl += cl;
	}
	return [ns stringByAppendingString:s];
}
+ (NSMutableString*) replace:(NSMutableString*)s sub:(NSMutableString*)sub by:(NSMutableString*)by{
	return [s replaceOccurrencesOfString:sub withString:by options:nil range:nil];
}
+ (NSMutableString*) hex:(int)n digits:(id)digits{
	
	NSMutableString *s = @"";
	
	NSMutableString *hexChars = @"0123456789ABCDEF";
	do {
		s = [[hexChars characterAtIndex:n & @"15"] stringByAppendingString:s];
		n >>>= 4;
	}while (n > 0);
	if (digits != nil) while (slength < digits) s = [@"0" stringByAppendingString:s];;
	return s;
}
+ (int) fastCodeAt:(NSMutableString*)s index:(int)index{
	return [scca "-dynamic_param-" ];
}
+ (BOOL) isEOF:(int)c{
	return c == -1;
}

@end
