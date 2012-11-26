#import "StringTools.h"

@implementation StringTools

-F-
+ (NSMutableString*) urlEncode:(NSMutableString*)s "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [s stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}
-F-
+ (NSMutableString*) urlDecode:(NSMutableString*)s "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [s stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
-F-
+ (NSMutableString*) htmlEscape:(NSMutableString*)s "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @"&"] "-FA-" .join: "-V-Const>"  "-E-Const>" @"&amp;"] "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @"<"] "-FA-" .join: "-V-Const>"  "-E-Const>" @"&lt;"] "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @">"] "-FA-" .join: "-V-Const>"  "-E-Const>" @"&gt;"];
}
-F-
+ (NSMutableString*) htmlUnescape:(NSMutableString*)s "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @"&gt;"] "-FA-" .join: "-V-Const>"  "-E-Const>" @">"] "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @"&lt;"] "-FA-" .join: "-V-Const>"  "-E-Const>" @"<"] "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @"&amp;"] "-FA-" .join: "-V-Const>"  "-E-Const>" @"&"];
}
-F-
+ (BOOL) startsWith:(NSMutableString*)s start:(NSMutableString*)start "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-" length >= "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" start "-FA-" length && "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 0 len: "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" start "-FA-" length] == "-gen_val_op-" "-V-Local>"  "-E-Local>" start;
}
-F-
+ (BOOL) endsWith:(NSMutableString*)s end:(NSMutableString*)end "-E-Block>" {
	 "-E-Vars>" int elen =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" end "-FA-" length;
	 "-E-Vars>" int slen =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-" length;
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" slen >= "-gen_val_op-" "-V-Local>"  "-E-Local>" elen && "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  substringWithRange: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" slen - "-gen_val_op-" "-V-Local>"  "-E-Local>" elen len: "-V-Local>"  "-E-Local>" elen] == "-gen_val_op-" "-V-Local>"  "-E-Local>" end;
}
-F-
+ (BOOL) isSpace:(NSMutableString*)s pos:(int)pos "-E-Block>" {
	 "-E-Vars>" id c =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  characterAtIndex: "-V-Local>"  "-E-Local>" pos];
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" c >= "-gen_val_op-" "-V-Const>"  "-E-Const>" 9 && "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" c <= "-gen_val_op-" "-V-Const>"  "-E-Const>" 13 || "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" c == "-gen_val_op-" "-V-Const>"  "-E-Const>" 32;
}
-F-
+ (NSMutableString*) ltrim:(NSMutableString*)s "-E-Block>" {
	 "-E-Vars>" int l =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-" length;
	 "-E-Vars>" int r =  "-V-Const>"  "-E-Const>" 0;
	 "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" r < "-gen_val_op-" "-V-Local>"  "-E-Local>" l && "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  isSpace: "-V-Local>"  "-E-Local>" s pos: "-V-Local>"  "-E-Local>" r])  "-E-Unop>"  "-V-Local>"  "-E-Local>" r++;
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" r > "-gen_val_op-" "-V-Const>"  "-E-Const>" 0)  "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  substringWithRange: "-V-Local>"  "-E-Local>" r len: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" l - "-gen_val_op-" "-V-Local>"  "-E-Local>" r];
	else  "-E-Return>" return  "-V-Local>"  "-E-Local>" s;
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;
}
-F-
+ (NSMutableString*) rtrim:(NSMutableString*)s "-E-Block>" {
	 "-E-Vars>" int l =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-" length;
	 "-E-Vars>" int r =  "-V-Const>"  "-E-Const>" 0;
	 "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" r < "-gen_val_op-" "-V-Local>"  "-E-Local>" l && "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  isSpace: "-V-Local>"  "-E-Local>" s pos: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" l - "-gen_val_op-" "-V-Local>"  "-E-Local>" r - "-gen_val_op-" "-V-Const>"  "-E-Const>" 1])  "-E-Unop>"  "-V-Local>"  "-E-Local>" r++;
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" r > "-gen_val_op-" "-V-Const>"  "-E-Const>" 0)  "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 0 len: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" l - "-gen_val_op-" "-V-Local>"  "-E-Local>" r];
	else  "-E-Return>" return  "-V-Local>"  "-E-Local>" s;
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;
}
-F-
+ (NSMutableString*) trim:(NSMutableString*)s "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  ltrim: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  rtrim: "-V-Local>"  "-E-Local>" s]];
}
-F-
+ (NSMutableString*) rpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l "-E-Block>" {
	 "-E-Vars>" int sl =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-" length;
	 "-E-Vars>" int cl =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" c "-FA-" length;
	 "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" sl < "-gen_val_op-" "-V-Local>"  "-E-Local>" l)  "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" l - "-gen_val_op-" "-V-Local>"  "-E-Local>" sl < "-gen_val_op-" "-V-Local>"  "-E-Local>" cl)  "-E-Block>" {
		 "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" s appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" c "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 0 len: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" l - "-gen_val_op-" "-V-Local>"  "-E-Local>" sl]];
		 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" sl = "-gen_val_op-" "-V-Local>"  "-E-Local>" l;
	};
	else  "-E-Block>" {
		 "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" s appendString:"-gen_val_op-" "-V-Local>"  "-E-Local>" c];
		 "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" sl appendString:"-gen_val_op-" "-V-Local>"  "-E-Local>" cl];
	}
	 "-E-Return>" return  "-V-Local>"  "-E-Local>" s;
}
-F-
+ (NSMutableString*) lpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l "-E-Block>" {
	 "-E-Vars>" 
	NSMutableString *ns =  "-V-Const>"  "-E-Const>" @"";
	 "-E-Vars>" int sl =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-" length;
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" sl >= "-gen_val_op-" "-V-Local>"  "-E-Local>" l)  "-E-Return>" return  "-V-Local>"  "-E-Local>" s;;
	 "-E-Vars>" int cl =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" c "-FA-" length;
	 "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" sl < "-gen_val_op-" "-V-Local>"  "-E-Local>" l)  "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" l - "-gen_val_op-" "-V-Local>"  "-E-Local>" sl < "-gen_val_op-" "-V-Local>"  "-E-Local>" cl)  "-E-Block>" {
		 "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" ns appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" c "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 0 len: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" l - "-gen_val_op-" "-V-Local>"  "-E-Local>" sl]];
		 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" sl = "-gen_val_op-" "-V-Local>"  "-E-Local>" l;
	};
	else  "-E-Block>" {
		 "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" ns appendString:"-gen_val_op-" "-V-Local>"  "-E-Local>" c];
		 "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" sl appendString:"-gen_val_op-" "-V-Local>"  "-E-Local>" cl];
	}
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" ns stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" s];
}
-F-
+ (NSMutableString*) replace:(NSMutableString*)s sub:(NSMutableString*)sub by:(NSMutableString*)by "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [s replaceOccurrencesOfString:sub withString:by options:nil range:nil];
}
-F-
+ (NSMutableString*) hex:(int)n digits:(id)digits "-E-Block>" {
	 "-E-Vars>" 
	NSMutableString *s =  "-V-Const>"  "-E-Const>" @"";
	 "-E-Vars>" 
	NSMutableString *hexChars =  "-V-Const>"  "-E-Const>" @"0123456789ABCDEF";
	 "-E-While>" do  "-E-Block>" {
		 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s = "-gen_val_op-" "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" hexChars "-FA-"  characterAtIndex: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" n & "-gen_val_op-" "-V-Const>"  "-E-Const>" 15] stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" s];
		 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" n >>>= "-gen_val_op-" "-V-Const>"  "-E-Const>" 4;
	}while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" n > "-gen_val_op-" "-V-Const>"  "-E-Const>" 0);
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" digits != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil)  "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-" length < "-gen_val_op-" "-V-Local>"  "-E-Local>" digits)  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s = "-gen_val_op-" "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Const>"  "-E-Const>" @"0" stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" s];;
	 "-E-Return>" return  "-V-Local>"  "-E-Local>" s;
}
-F-
+ (int) fastCodeAt:(NSMutableString*)s index:(int)index "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-" cca "-dynamic_param-" ];
}
-F-
+ (BOOL) isEOF:(int)c "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" c == "-gen_val_op-" "-V-Const>"  "-E-Const>" -1;
}

@end
