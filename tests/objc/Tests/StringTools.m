#import "StringTools.h"

@implementation StringTools

+ (NSMutableString*) urlEncode:(NSMutableString*)s{
	return nil;
}
+ (NSMutableString*) urlDecode:(NSMutableString*)s{
	return nil;
}
+ (NSMutableString*) htmlEscape:(NSMutableString*)s{
	return [[[[[[s componentsSeparatedByString:split:@"&"].join:@"&amp;"] componentsSeparatedByString:split:@"<"].join:@"&lt;"] componentsSeparatedByString:split:@">"].join:@"&gt;"];
}
+ (NSMutableString*) htmlUnescape:(NSMutableString*)s{
	return [[[[[[s componentsSeparatedByString:split:@"&gt;"].join:@">"] componentsSeparatedByString:split:@"&lt;"].join:@"<"] componentsSeparatedByString:split:@"&amp;"].join:@"&"];
}
+ (BOOL) startsWith:(NSMutableString*)s start:(NSMutableString*)start{
	return s.length >= start.length && [s substringWithRange:substr:0 len:start length] == start;
}
+ (BOOL) endsWith:(NSMutableString*)s end:(NSMutableString*)end{
	int elen = end.length;
	int slen = s.length;
	return slen >= elen && [s substringWithRange:substr:slen - elen len:elen] == end;
}
+ (BOOL) isSpace:(NSMutableString*)s pos:(int)pos{
	id c = [s characterAtIndex:pos];
	return c >= 9 && c <= 13 || c == 32;
}
+ (NSMutableString*) ltrim:(NSMutableString*)s{
	int l = s.length;
	int r = 0;
	while (r < l && [StringTools isSpace:s pos:r]) r++;
	if (r > 0) return [s substringWithRange:substr:r len:l - r];
	else return s;
	return nil;
}
+ (NSMutableString*) rtrim:(NSMutableString*)s{
	int l = s.length;
	int r = 0;
	while (r < l && [StringTools isSpace:s pos:l - r - 1]) r++;
	if (r > 0) return [s substringWithRange:substr:0 len:l - r];
	else return s;
	return nil;
}
+ (NSMutableString*) trim:(NSMutableString*)s{
	return [StringTools ltrim:[StringTools rtrim:s]];
}
+ (NSMutableString*) rpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l{
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
+ (NSMutableString*) lpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l{
	
	NSMutableString *ns = @"";
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
+ (NSMutableString*) replace:(NSMutableString*)s sub:(NSMutableString*)sub by:(NSMutableString*)by{
	return [[s componentsSeparatedByString:split:sub].join:by];
}
+ (NSMutableString*) hex:(int)n digits:(id)digits{
	
	NSMutableString *s = @"";
	
	NSMutableString *hexChars = @"0123456789ABCDEF";
	do {
		s = [hexChars characterAtIndex:n & 15] + s;
		n >>>= 4;
	}while (n > 0);
	if (digits != nil) while (s.length < digits) s = @"0" + s;;
	return s;
}
+ (int) fastCodeAt:(NSMutableString*)s index:(int)index{
	return [s.charCodeAt-non-];
}
+ (BOOL) isEOF:(int)c{
	return NO;
}

@end
