#import "StringTools.h"

@implementation StringTools
+ (NSString*) urlEncode:(NSString*)s{
	return nil;
}
+ (NSString*) urlDecode:(NSString*)s{
	return nil;
}
+ (NSString*) htmlEscape:(NSString*)s{
	return [[[[[[s componentsSeparatedByString:split:@"&"].join:@"&amp;"] componentsSeparatedByString:split:@"<"].join:@"&lt;"] componentsSeparatedByString:split:@">"].join:@"&gt;"];
}
+ (NSString*) htmlUnescape:(NSString*)s{
	return [[[[[[s componentsSeparatedByString:split:@"&gt;"].join:@">"] componentsSeparatedByString:split:@"&lt;"].join:@"<"] componentsSeparatedByString:split:@"&amp;"].join:@"&"];
}
+ (BOOL) startsWith:(NSString*)s start:(NSString*)start{
	return s.length >= start.length && [s substringWithRange:substr:0 len:start length] == start;
}
+ (BOOL) endsWith:(NSString*)s end:(NSString*)end{
	int elen = end.length;
	int slen = s.length;
	return slen >= elen && [s substringWithRange:substr:slen - elen len:elen] == end;
}
+ (BOOL) isSpace:(NSString*)s pos:(int)pos{
	id c = [s characterAtIndex:pos];
	return c >= 9 && c <= 13 || c == 32;
}
+ (NSString*) ltrim:(NSString*)s{
	int l = s.length;
	int r = 0;
	while (r < l && [StringTools isSpace:s pos:r]) r++;
	if (r > 0) return [s substringWithRange:substr:r len:l - r];
	else return s;
	return nil;
}
+ (NSString*) rtrim:(NSString*)s{
	int l = s.length;
	int r = 0;
	while (r < l && [StringTools isSpace:s pos:l - r - 1]) r++;
	if (r > 0) return [s substringWithRange:substr:0 len:l - r];
	else return s;
	return nil;
}
+ (NSString*) trim:(NSString*)s{
	return [StringTools ltrim:[StringTools rtrim:s]];
}
+ (NSString*) rpad:(NSString*)s c:(NSString*)c l:(int)l{
	int sl = s.length;
	int cl = c.length;
	while (sl < l) if (l - sl < cl) {
		s += [c substringWithRange:substr:0 len:l - sl];
		sl = l;
	};
	else {
		s += c;
		sl += cl;
	}
	return s;
}
+ (NSString*) lpad:(NSString*)s c:(NSString*)c l:(int)l{
	
	NSString *ns = @"";
	int sl = s.length;
	if (sl >= l) return s;;
	int cl = c.length;
	while (sl < l) if (l - sl < cl) {
		ns += [c substringWithRange:substr:0 len:l - sl];
		sl = l;
	};
	else {
		ns += c;
		sl += cl;
	}
	return ns + s;
}
+ (NSString*) replace:(NSString*)s sub:(NSString*)sub by:(NSString*)by{
	return [[s componentsSeparatedByString:split:sub].join:by];
}
+ (NSString*) hex:(int)n digits:(id)digits{
	
	NSString *s = @"";
	
	NSString *hexChars = @"0123456789ABCDEF";
	do {
		s = [hexChars characterAtIndex:n & 15] + s;
		n >>>= 4;
	}while (n > 0);
	if (digits != nil) while (s.length < digits) s = @"0" + s;;
	return s;
}
+ (int) fastCodeAt:(NSString*)s index:(int)index{
	return [s.charCodeAt-non-];
}
+ (BOOL) isEOF:(int)c{
	return NO;
}

@end
