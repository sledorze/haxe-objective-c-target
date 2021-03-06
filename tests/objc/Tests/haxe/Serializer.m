//
//  Serializer
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "../haxe/Serializer.h"

@implementation Serializer

+ (BOOL) USE_CACHE:(BOOL)val {
	static BOOL _val;
	if (val == nil) { if (_val == nil) _val = NO; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (BOOL) USE_ENUM_INDEX:(BOOL)val {
	static BOOL _val;
	if (val == nil) { if (_val == nil) _val = NO; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (NSMutableString*) BASE64:(NSMutableString*)val {
	static NSMutableString *_val;
	if (val == nil) { if (_val == nil) _val = (NSMutableString*)@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%:"; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (NSMutableString*) run:(id)v{
	
	Serializer *s = [[Serializer alloc] init];
	[s serialize:v];
	return [s toString];
}
@synthesize buf;
@synthesize cache;
@synthesize shash;
@synthesize scount;
@synthesize useCache;
@synthesize useEnumIndex;
- (NSMutableString*) toString{
	return self.buf.b;
}
- (void) serializeString:(NSMutableString*)s{
	int x = [self.shash get:s];
	if (x != nil) {
		[self.buf.b appendString:(NSMutableString*)@"R"];
		self.buf.b += [Std string:x];
		return;
	}
	[self.shash set:s value:self.scount++];
	[self.buf.b appendString:(NSMutableString*)@"y"];
	s = [StringTools urlEncode:s];
	self.buf.b += [Std string:s.length];
	[self.buf.b appendString:(NSMutableString*)@":"];
	self.buf.b += [Std string:s];
}
- (BOOL) serializeRef:(id)v{
	{
		int _g1 = 0; int _g = self.cache.length;
		while (_g1 < _g) {
			int i = _g1++;
			if ([self.cache objectAtIndex:i] == v) {
				[self.buf.b appendString:(NSMutableString*)@"r"];
				self.buf.b += [Std string:i];
				return YES;
			}
		}
	}
	[self.cache push:v];
	return NO;
}
- (void) serializeFields:(id)v{
	{
		int _g = 0; 
		NSMutableArray *_g1 = (NSMutableArray*)[Reflect fields:v];
		while (_g < _g1.length) {
			
			NSMutableString *f = [_g1 objectAtIndex:_g];
			++_g;
			[self serializeString:f];
			[self serialize:[Reflect field:v field:f]];
		}
	}
	[self.buf.b appendString:(NSMutableString*)@"g"];
}
- (void) serialize:(id)v{
	
	Type *_g = [Type _typeof:v];
	
	var $e : enum =  (_g)
	switch ( $e.index ) {
		
		case 0:
		{
			[self.buf.b appendString:(NSMutableString*)@"n"]}break
		case 1:
		{
			{
				if (v == 0) {
					[self.buf.b appendString:(NSMutableString*)@"z"];
					return;
				}
				[self.buf.b appendString:(NSMutableString*)@"i"];
				self.buf.b += [Std string:v];
			}}break
		case 2:
		{
			if (isnan(v)) [self.buf.b appendString:(NSMutableString*)@"k"];
			else if (!isfinite(v)) self.buf.b += [Std string:( (v < 0) ? (NSMutableString*)@"m" : (NSMutableString*)@"p")];
			else {
				[self.buf.b appendString:(NSMutableString*)@"d"];
				self.buf.b += [Std string:v];
			}}break
		case 3:
		{
			self.buf.b += [Std string:( (v) ? (NSMutableString*)@"t" : (NSMutableString*)@"f")]}break
		case 6:
		
		var MATCH _g_eTClass_0 : Class = $e.params[0]{
			{
				if (_g_eTClass_0 == NSMutableString) {
					[self serializeString:v];
					return;
				}
				if (self.useCache && [self serializeRef:v]) return;
				switch (_g_eTClass_0){
					case NSMutableArray:{
						{
							int ucount = 0;
							[self.buf.b appendString:(NSMutableString*)@"a"];
							int l = [v objectAtIndex:(NSMutableString*)@"length"];
							{
								int _g1 = 0;
								while (_g1 < (int)l) {
									int i = _g1++;
									if ([v objectAtIndex:i] == nil) ucount++;
									else {
										if (ucount > 0) {
											if (ucount == 1) [self.buf.b appendString:(NSMutableString*)@"n"];
											else {
												[self.buf.b appendString:(NSMutableString*)@"u"];
												self.buf.b += [Std string:ucount];
											}
											ucount = 0;
										}
										[self serialize:[v objectAtIndex:i]];
									}
								}
							}
							if (ucount > 0) {
								if (ucount == 1) [self.buf.b appendString:(NSMutableString*)@"n"];
								else {
									[self.buf.b appendString:(NSMutableString*)@"u"];
									self.buf.b += [Std string:ucount];
								}
							}
							[self.buf.b appendString:(NSMutableString*)@"h"];
						}}break;
					case List:{
						{
							[self.buf.b appendString:(NSMutableString*)@"l"];
							
							List *v1 = v;
							{
								id _it2 = [v1 iterator];
								while ( [_it2 hasNext] ) do {
									id i = [_it2 next];
									[self serialize:i];
								}
							}
							[self.buf.b appendString:(NSMutableString*)@"h"];
						}}break;
					case NSDate:{
						{
							
							NSDate *d = v;
							[self.buf.b appendString:(NSMutableString*)@"v"];
							self.buf.b += [Std string:[d toString]];
						}}break;
					case StringMap:{
						{
							[self.buf.b appendString:(NSMutableString*)@"b"];
							
							StringMap *v1 = v;
							{
								id _it3 = [v1 keys];
								while ( [_it3 hasNext] ) do {
									NSMutableString k = [_it3 next];
									{
										[self serializeString:k];
										[self serialize:[v1 get:k]];
									};
								}
							}
							[self.buf.b appendString:(NSMutableString*)@"h"];
						}}break;
					case IntMap:{
						{
							[self.buf.b appendString:(NSMutableString*)@"q"];
							
							IntMap *v1 = v;
							{
								id _it4 = [v1 keys];
								while ( [_it4 hasNext] ) do {
									int k = [_it4 next];
									{
										[self.buf.b appendString:(NSMutableString*)@":"];
										self.buf.b += [Std string:k];
										[self serialize:[v1 get:k]];
									};
								}
							}
							[self.buf.b appendString:(NSMutableString*)@"h"];
						}}break;
					case ObjectMap:{
						{
							[self.buf.b appendString:(NSMutableString*)@"M"];
							
							ObjectMap *v1 = v;
							{
								id _it5 = [v1 keys];
								while ( [_it5 hasNext] ) do {
									id k = [_it5 next];
									{
										[self serialize:k];
										[self serialize:[v1 get:k]];
									};
								}
							}
							[self.buf.b appendString:(NSMutableString*)@"h"];
						}}break;
					case Bytes:{
						{
							
							Bytes *v1 = v;
							int i = 0;
							int max = v1.length - 2;
							
							StringBuf *charsBuf = [[StringBuf alloc] init];
							
							NSMutableString *b64 = Serializer.BASE64;
							while (i < max) {
								int b1 = [v1.b objectAtIndex:i++];
								int b2 = [v1.b objectAtIndex:i++];
								int b3 = [v1.b objectAtIndex:i++];
								charsBuf.b += [Std string:[b64 characterAtIndex:b1 >> 2]];
								charsBuf.b += [Std string:[b64 characterAtIndex: (b1 << 4 | b2 >> 4) & 63]];
								charsBuf.b += [Std string:[b64 characterAtIndex: (b2 << 2 | b3 >> 6) & 63]];
								charsBuf.b += [Std string:[b64 characterAtIndex:b3 & 63]];
							}
							if (i == max) {
								int b1 = [v1.b objectAtIndex:i++];
								int b2 = [v1.b objectAtIndex:i++];
								charsBuf.b += [Std string:[b64 characterAtIndex:b1 >> 2]];
								charsBuf.b += [Std string:[b64 characterAtIndex: (b1 << 4 | b2 >> 4) & 63]];
								charsBuf.b += [Std string:[b64 characterAtIndex:b2 << 2 & 63]];
							}
							else if (i == max + 1) {
								int b1 = [v1.b objectAtIndex:i++];
								charsBuf.b += [Std string:[b64 characterAtIndex:b1 >> 2]];
								charsBuf.b += [Std string:[b64 characterAtIndex:b1 << 4 & 63]];
							}
							
							NSMutableString *chars = charsBuf.b;
							[self.buf.b appendString:(NSMutableString*)@"s"];
							self.buf.b += [Std string:chars.length];
							[self.buf.b appendString:(NSMutableString*)@":"];
							self.buf.b += [Std string:chars];
						}}break;
					default:{
						{
							[self.cache pop];
							if ([v hxSerialize] != nil) {
								[self.buf.b appendString:(NSMutableString*)@"C"];
								[self serializeString:[Type getClassName:_g_eTClass_0]];
								[self.cache push:v];
								[v hxSerialize-TDynamic-];
								[self.buf.b appendString:(NSMutableString*)@"g"];
							}
							else {
								[self.buf.b appendString:(NSMutableString*)@"c"];
								[self serializeString:[Type getClassName:_g_eTClass_0]];
								[self.cache push:v];
								[self serializeFields:v];
							}
						}}break;
				}
			}}break
		case 4:
		{
			{
				if (self.useCache && [self serializeRef:v]) return;
				[self.buf.b appendString:(NSMutableString*)@"o"];
				[self serializeFields:v];
			}}break
		case 7:
		
		var MATCH _g_eTEnum_0 : Enum = $e.params[0]{
			{
				if (self.useCache && [self serializeRef:v]) return;
				[self.cache pop];
				self.buf.b += [Std string:( (self.useEnumIndex) ? (NSMutableString*)@"j" : (NSMutableString*)@"w")];
				[self serializeString:[Type getEnumName:_g_eTEnum_0]];
				if (self.useEnumIndex) {
					[self.buf.b appendString:(NSMutableString*)@":"];
					self.buf.b += [Std string:[v objectAtIndex:1]];
				}
				else [self serializeString:[v objectAtIndex:0]];
				[self.buf.b appendString:(NSMutableString*)@":"];
				int l = [v objectAtIndex:(NSMutableString*)@"length"];
				self.buf.b += [Std string:l - 2];
				{
					int _g1 = 2;
					while (_g1 < (int)l) {
						int i = _g1++;
						[self serialize:[v objectAtIndex:i]];
					}
				}
				[self.cache push:v];
			}}break
		case 5:
		{
			@throw (NSMutableString*)@"Cannot serialize function";}break
		default:{
			@throw [(NSMutableString*)@"Cannot serialize " stringByAppendingString:[Std string:v]];}break
	}
}
- (void) serializeException:(id)e{
	[self.buf.b appendString:(NSMutableString*)@"x"];
	[self serialize:e];
}
- (id) init{
	self = [super init];
	self.buf = [[StringBuf alloc] init];
	self.cache = [[NSMutableArray alloc] init];
	self.useCache = Serializer.USE_CACHE;
	self.useEnumIndex = Serializer.USE_ENUM_INDEX;
	self.shash = [[StringMap alloc] init];
	self.scount = 0;
	return self;
}

@end
