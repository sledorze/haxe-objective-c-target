#import "DateTools.h"

@implementation DateTools

-F-
+ (NSMutableString*) __format_get:(NSDate*)d e:(NSMutableString*)e "-E-Block>" {
	 "-E-Return>" return  "-V-Switch>" - (NSMutableString*)  "-E-Switch>" switch "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Local>"  "-E-Local>" e){
		case  "-V-Const>"  "-E-Const>" @"%":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Const>"  "-E-Const>" @"%"}break;
		case  "-V-Const>"  "-E-Const>" @"C":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  lpad: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  int: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getFullYear] / "-gen_val_op-" "-V-Const>"  "-E-Const>" 100]] c: "-V-Const>"  "-E-Const>" @"0" l: "-V-Const>"  "-E-Const>" 2]}break;
		case  "-V-Const>"  "-E-Const>" @"d":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  lpad: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getDate]] c: "-V-Const>"  "-E-Const>" @"0" l: "-V-Const>"  "-E-Const>" 2]}break;
		case  "-V-Const>"  "-E-Const>" @"D":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" DateTools "-FA-"  __format: "-V-Local>"  "-E-Local>" d f: "-V-Const>"  "-E-Const>" @"%m/%d/%y"]}break;
		case  "-V-Const>"  "-E-Const>" @"e":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getDate]]}break;
		case  "-V-Const>"  "-E-Const>" @"H":case  "-V-Const>"  "-E-Const>" @"k":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  lpad: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getHours]] c: "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" e == "-gen_val_op-" "-V-Const>"  "-E-Const>" @"H") ?  "-V-Const>"  "-E-Const>" @"0" :  "-V-Const>"  "-E-Const>" @" ") l: "-V-Const>"  "-E-Const>" 2]}break;
		case  "-V-Const>"  "-E-Const>" @"I":case  "-V-Const>"  "-E-Const>" @"l":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Block>" - (NSMutableString*)  "-E-Vars>" int hour =  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getHours] % "-gen_val_op-" "-V-Const>"  "-E-Const>" 12
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r2 = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  lpad: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" hour == "-gen_val_op-" "-V-Const>"  "-E-Const>" 0) ?  "-V-Const>"  "-E-Const>" 12 :  "-V-Local>"  "-E-Local>" hour)] c: "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" e == "-gen_val_op-" "-V-Const>"  "-E-Const>" @"I") ?  "-V-Const>"  "-E-Const>" @"0" :  "-V-Const>"  "-E-Const>" @" ") l: "-V-Const>"  "-E-Const>" 2]
			return $r2{
				
				NSMutableString* $r2}
			}()}break;
		case  "-V-Const>"  "-E-Const>" @"m":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  lpad: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getMonth] stringByAppendingString:"-gen_val_op-" "-V-Const>"  "-E-Const>" 1]] c: "-V-Const>"  "-E-Const>" @"0" l: "-V-Const>"  "-E-Const>" 2]}break;
		case  "-V-Const>"  "-E-Const>" @"M":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  lpad: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getMinutes]] c: "-V-Const>"  "-E-Const>" @"0" l: "-V-Const>"  "-E-Const>" 2]}break;
		case  "-V-Const>"  "-E-Const>" @"n":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Const>"  "-E-Const>" @"\n"}break;
		case  "-V-Const>"  "-E-Const>" @"p":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getHours] > "-gen_val_op-" "-V-Const>"  "-E-Const>" 11) ?  "-V-Const>"  "-E-Const>" @"PM" :  "-V-Const>"  "-E-Const>" @"AM")}break;
		case  "-V-Const>"  "-E-Const>" @"r":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" DateTools "-FA-"  __format: "-V-Local>"  "-E-Local>" d f: "-V-Const>"  "-E-Const>" @"%I:%M:%S %p"]}break;
		case  "-V-Const>"  "-E-Const>" @"R":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" DateTools "-FA-"  __format: "-V-Local>"  "-E-Local>" d f: "-V-Const>"  "-E-Const>" @"%H:%M"]}break;
		case  "-V-Const>"  "-E-Const>" @"s":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  int: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getTime] / "-gen_val_op-" "-V-Const>"  "-E-Const>" 1000]]}break;
		case  "-V-Const>"  "-E-Const>" @"S":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  lpad: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getSeconds]] c: "-V-Const>"  "-E-Const>" @"0" l: "-V-Const>"  "-E-Const>" 2]}break;
		case  "-V-Const>"  "-E-Const>" @"t":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Const>"  "-E-Const>" @"\t"}break;
		case  "-V-Const>"  "-E-Const>" @"T":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" DateTools "-FA-"  __format: "-V-Local>"  "-E-Local>" d f: "-V-Const>"  "-E-Const>" @"%H:%M:%S"]}break;
		case  "-V-Const>"  "-E-Const>" @"u":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Block>" - (NSMutableString*)  "-E-Vars>" int t =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getDay]
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r3 = "-gen_val_op-" "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" t == "-gen_val_op-" "-V-Const>"  "-E-Const>" 0) ?  "-V-Const>"  "-E-Const>" @"7" :  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Local>"  "-E-Local>" t])
			return $r3{
				
				NSMutableString* $r3}
			}()}break;
		case  "-V-Const>"  "-E-Const>" @"w":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getDay]]}break;
		case  "-V-Const>"  "-E-Const>" @"y":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  lpad: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getFullYear] % "-gen_val_op-" "-V-Const>"  "-E-Const>" 100] c: "-V-Const>"  "-E-Const>" @"0" l: "-V-Const>"  "-E-Const>" 2]}break;
		case  "-V-Const>"  "-E-Const>" @"Y":{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getFullYear]]}break;
		default:{
			 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" $r = "-gen_val_op-" "-V-Throw>" - (NSMutableString*)  "-E-Throw>" throw  "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Const>"  "-E-Const>" @"Date.format %" stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" e] stringByAppendingString:"-gen_val_op-" "-V-Const>"  "-E-Const>" @"- not implemented yet."]
			return $r4{
				
				NSMutableString* $r4}
			}()}break
	}
	return $r{
		
		NSMutableString* $r}
	}();
}
-F-
+ (NSMutableString*) __format:(NSDate*)d f:(NSMutableString*)f "-E-Block>" {
	 "-E-Vars>" 
	StringBuf *r =  "-V-New>"  "-E-New>" [[StringBuf alloc] new];
	 "-E-Vars>" int p =  "-V-Const>"  "-E-Const>" 0;
	 "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Const>"  "-E-Const>" YES)  "-E-Block>" {
		 "-E-Vars>" int np =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" f "-FA-"  rangeOfString: "-V-Const>"  "-E-Const>" @"%" startIndex: "-V-Local>"  "-E-Local>" p];
		 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" np < "-gen_val_op-" "-V-Const>"  "-E-Const>" 0)  "-E-Break>" break;;
		 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" r "-FA-" .b appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" f "-FA-"  substringWithRange: "-V-Local>"  "-E-Local>" p len: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" np - "-gen_val_op-" "-V-Local>"  "-E-Local>" p]];
		 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" r "-FA-" .b appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" DateTools "-FA-"  __format_get: "-V-Local>"  "-E-Local>" d e: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" f "-FA-"  substringWithRange: "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" np stringByAppendingString:"-gen_val_op-" "-V-Const>"  "-E-Const>" 1] len: "-V-Const>"  "-E-Const>" 1]]]];
		 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" p = "-gen_val_op-" "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" np stringByAppendingString:"-gen_val_op-" "-V-Const>"  "-E-Const>" 2];
	}
	 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" r "-FA-" .b appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" f "-FA-"  substringWithRange: "-V-Local>"  "-E-Local>" p len: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" f "-FA-" length - "-gen_val_op-" "-V-Local>"  "-E-Local>" p]];
	 "-E-Return>" return  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" r "-FA-" .b;
}
-F-
+ (NSMutableString*) format:(NSDate*)d f:(NSMutableString*)f "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" DateTools "-FA-"  __format: "-V-Local>"  "-E-Local>" d f: "-V-Local>"  "-E-Local>" f];
}
-F-
+ (NSDate*) delta:(NSDate*)d t:(float)t "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" NSDate "-FA-" fromTime: "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getTime] stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" t]];
}
-F-
+ (NSMutabeArray*) DAYS_OF_MONTH:(NSMutabeArray*)val {
	static NSMutabeArray *_val;
	if (val == nil) { if (_val == nil) _val =  "-V-ArrayDecl>"  "-E-ArrayDecl>" [[NSMutableArray alloc] initWithObjects: "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:31],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:28],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:31],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:30],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:31],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:30],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:31],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:31],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:30],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:31],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:30],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:31], nil]]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
-F-
+ (int) getMonthDays:(NSDate*)d "-E-Block>" {
	 "-E-Vars>" int month =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getMonth];
	 "-E-Vars>" int year =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" d "-FA-" getFullYear];
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" month != "-gen_val_op-" "-V-Const>"  "-E-Const>" 1)  "-E-Return>" return  "-V-Array>"  "-E-Array>" [ "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" DateTools "-FA-" .DAYS_OF_MONTH objectAtIndex: "-V-Local>"  "-E-Local>" month];;
	 "-E-Vars>" BOOL isB =  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" year % "-gen_val_op-" "-V-Const>"  "-E-Const>" 4 == "-gen_val_op-" "-V-Const>"  "-E-Const>" 0 && "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" year % "-gen_val_op-" "-V-Const>"  "-E-Const>" 100 != "-gen_val_op-" "-V-Const>"  "-E-Const>" 0 || "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" year % "-gen_val_op-" "-V-Const>"  "-E-Const>" 400 == "-gen_val_op-" "-V-Const>"  "-E-Const>" 0;
	 "-E-Return>" return  "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Local>"  "-E-Local>" isB) ?  "-V-Const>"  "-E-Const>" 29 :  "-V-Const>"  "-E-Const>" 28);
}
-F-
+ (float) seconds:(float)n "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" n * "-gen_val_op-" "-V-Const>"  "-E-Const>" 1000.0;
}
-F-
+ (float) minutes:(float)n "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" n * "-gen_val_op-" "-V-Const>"  "-E-Const>" 60.0 * "-gen_val_op-" "-V-Const>"  "-E-Const>" 1000.0;
}
-F-
+ (float) hours:(float)n "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" n * "-gen_val_op-" "-V-Const>"  "-E-Const>" 60.0 * "-gen_val_op-" "-V-Const>"  "-E-Const>" 60.0 * "-gen_val_op-" "-V-Const>"  "-E-Const>" 1000.0;
}
-F-
+ (float) days:(float)n "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" n * "-gen_val_op-" "-V-Const>"  "-E-Const>" 24.0 * "-gen_val_op-" "-V-Const>"  "-E-Const>" 60.0 * "-gen_val_op-" "-V-Const>"  "-E-Const>" 60.0 * "-gen_val_op-" "-V-Const>"  "-E-Const>" 1000.0;
}
-F-
+ (id) parse:(float)t "-E-Block>" {
	 "-E-Vars>" float s =  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" t / "-gen_val_op-" "-V-Const>"  "-E-Const>" 1000;
	 "-E-Vars>" float m =  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s / "-gen_val_op-" "-V-Const>"  "-E-Const>" 60;
	 "-E-Vars>" float h =  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" m / "-gen_val_op-" "-V-Const>"  "-E-Const>" 60;
	 "-E-Return>" return  "-V-ObjectDecl>"  "-E-ObjectDecl>" {ms: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" t % "-gen_val_op-" "-V-Const>"  "-E-Const>" 1000 ,seconds: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  int: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s % "-gen_val_op-" "-V-Const>"  "-E-Const>" 60] ,minutes: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  int: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" m % "-gen_val_op-" "-V-Const>"  "-E-Const>" 60] ,hours: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  int: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" h % "-gen_val_op-" "-V-Const>"  "-E-Const>" 24] ,days: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  int: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" h / "-gen_val_op-" "-V-Const>"  "-E-Const>" 24]};
}
-F-
+ (float) make:(id)o "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  GFA2 .ms stringByAppendingString:"-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Const>"  "-E-Const>" 1000.0 * "-gen_val_op-" "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  GFA2 .seconds stringByAppendingString:"-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Const>"  "-E-Const>" 60.0 * "-gen_val_op-" "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  GFA2 .minutes stringByAppendingString:"-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Const>"  "-E-Const>" 60.0 * "-gen_val_op-" "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  GFA2 .hours stringByAppendingString:"-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Const>"  "-E-Const>" 24.0 * "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  GFA2 .days])])])];
}

@end
