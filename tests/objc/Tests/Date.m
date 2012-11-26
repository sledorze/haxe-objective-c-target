#import "Date.h"

@implementation Date

-F-
+ (NSDate*) now "-E-Block>" {
	 "-E-Vars>" 
	NSCalendar *calendar =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" NSCalendar "-FA-"  currentCalendar];
	 "-E-Vars>" 
	NSDateComponents *components =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" calendar "-FA-"  components: "-V-Const>"  "-E-Const>" 7 fromDate: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" NSDate "-FA-"  date]];
	 "-E-Return>" return  "-V-New>"  "-E-New>" [[NSDate alloc] new: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" components "-FA-"  year], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" components "-FA-"  month], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" components "-FA-"  day], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" components "-FA-"  hour], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" components "-FA-"  minute], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" components "-FA-"  second]];
}
-F-
+ (NSDate*) fromTime:(float)t "-E-Block>" {
	 "-E-Vars>" 
	NSDate *result =  "-V-New>"  "-E-New>" [[NSDate alloc] new: "-V-Const>"  "-E-Const>" 0, "-V-Const>"  "-E-Const>" 0, "-V-Const>"  "-E-Const>" 0, "-V-Const>"  "-E-Const>" 0, "-V-Const>"  "-E-Const>" 0, "-V-Const>"  "-E-Const>" 0];
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" result "-FA-" _seconds = "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" t * "-gen_val_op-" "-V-Const>"  "-E-Const>" 0.001;
	 "-E-Return>" return  "-V-Local>"  "-E-Local>" result;
}
-F-
+ (NSDate*) fromString:(NSMutableString*)s "-E-Block>" {
	 "-E-Switch>" switch "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-" length){
		case  "-V-Const>"  "-E-Const>" 8:{
			 "-E-Block>" {
				 "-E-Vars>" 
				NSMutabeArray *k =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @":"];
				 "-E-Vars>" 
				NSDate *d =  "-V-New>"  "-E-New>" [[NSDate alloc] new: "-V-Const>"  "-E-Const>" 0, "-V-Const>"  "-E-Const>" 0, "-V-Const>"  "-E-Const>" 0, "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" k objectAtIndex: "-V-Const>"  "-E-Const>" 0]], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" k objectAtIndex: "-V-Const>"  "-E-Const>" 1]], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" k objectAtIndex: "-V-Const>"  "-E-Const>" 2]]];
				 "-E-Return>" return  "-V-Local>"  "-E-Local>" d;
			}}break;
		case  "-V-Const>"  "-E-Const>" 10:{
			 "-E-Block>" {
				 "-E-Vars>" 
				NSMutabeArray *k =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @"-"];
				 "-E-Return>" return  "-V-New>"  "-E-New>" [[NSDate alloc] new: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" k objectAtIndex: "-V-Const>"  "-E-Const>" 0]], "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" k objectAtIndex: "-V-Const>"  "-E-Const>" 1]] - "-gen_val_op-" "-V-Const>"  "-E-Const>" 1, "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" k objectAtIndex: "-V-Const>"  "-E-Const>" 2]], "-V-Const>"  "-E-Const>" 0, "-V-Const>"  "-E-Const>" 0, "-V-Const>"  "-E-Const>" 0];
			}}break;
		case  "-V-Const>"  "-E-Const>" 19:{
			 "-E-Block>" {
				 "-E-Vars>" 
				NSMutabeArray *k =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @" "];
				 "-E-Vars>" 
				NSMutabeArray *y =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" k objectAtIndex: "-V-Const>"  "-E-Const>" 0] "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @"-"];
				 "-E-Vars>" 
				NSMutabeArray *t =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" k objectAtIndex: "-V-Const>"  "-E-Const>" 1] "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @":"];
				 "-E-Return>" return  "-V-New>"  "-E-New>" [[NSDate alloc] new: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" y objectAtIndex: "-V-Const>"  "-E-Const>" 0]], "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" y objectAtIndex: "-V-Const>"  "-E-Const>" 1]] - "-gen_val_op-" "-V-Const>"  "-E-Const>" 1, "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" y objectAtIndex: "-V-Const>"  "-E-Const>" 2]], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" t objectAtIndex: "-V-Const>"  "-E-Const>" 0]], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" t objectAtIndex: "-V-Const>"  "-E-Const>" 1]], "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  parseInt: "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" t objectAtIndex: "-V-Const>"  "-E-Const>" 2]]];
			}}break;
		default:{
			 "-E-Throw>" throw  "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Const>"  "-E-Const>" @"Invalid date format : " stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" s]}break
	}
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;
}
-F-
@synthesize _seconds;
-F-
@synthesize _calendar;
-F-
@synthesize _components;
-F-
- (float) getTime "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _seconds * "-gen_val_op-" "-V-Const>"  "-E-Const>" 1000.0;
}
-F-
- (int) getHours "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .hour];
}
-F-
- (int) getMinutes "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .minute];
}
-F-
- (int) getSeconds "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .second];
}
-F-
- (int) getFullYear "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .year];
}
-F-
- (int) getMonth "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .month];
}
-F-
- (int) getDate "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .weekday];
}
-F-
- (int) getDay "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .day];
}
-F-
- (NSMutableString*) toString "-E-Block>" {
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;
}
-F-
- (id) new:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec "-E-Block>" {
	self = [super init];
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _calendar = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" NSCalendar "-FA-" .currentCalendar];
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _calendar "-FA-" .components: "-V-Const>"  "-E-Const>" 7 fromDate: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" NSDate "-FA-"  date]];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .setYear: "-V-Local>"  "-E-Local>" year];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .setMonth: "-V-Local>"  "-E-Local>" month];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .setDay: "-V-Local>"  "-E-Local>" day];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .setHour: "-V-Local>"  "-E-Local>" hour];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .setMinute: "-V-Local>"  "-E-Local>" min];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" _components "-FA-" .setSecond: "-V-Local>"  "-E-Local>" sec];
	 "-E-Call>" self = _calendar.dateFromComponents ( _components );
	return self;
}

@end
