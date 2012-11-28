#import "Input.h"

@implementation Input


- (int) readByte{
	return ((int)($this:(snd ctx.path)) throw @"Not implemented"
	return $r{
		
		int* $r}
	}(self));
}
- (int) readBytes:(Bytes*)s pos:(int)pos len:(int)len{
	int k = len;
	
	NSMutabeArray *b = s.b;
	if (pos < 0 || len < 0 || pos + len > s.length) throw Error.OutsideBounds;
	while (k > 0) {
		[b objectAtIndex:pos] = [self readByte];
		pos++;
		k--;
	}
	return len;
}
- (void) close{
}
- (BOOL) setEndian:(BOOL)b{
	self.bigEndian = b;
	return b;
}
- (Bytes*) readAll:(id)bufsize{
	if (bufsize == nil) bufsize = 16384;
	
	Bytes *buf = [Bytes alloc:bufsize];
	
	BytesBuffer *total = [[BytesBuffer alloc] new];
	@try {
		while (YES) {
			int len = [self readBytes:buf pos:0 len:bufsize];
			if (len == 0) throw Error.Blocked;
			{
				if (len < 0 || len > buf.length) throw Error.OutsideBounds;
				
				NSMutabeArray *b1 = total.b;
				
				NSMutabeArray *b2 = buf.b;
				{
					int _g1 = 0; int _g = len;
					while (_g1 < _g) {
						int i = _g1++;
						[total b push:[b2 objectAtIndex:i]];
					}
				}
			}
		}
	}
	@catch (NSException *e) {
	}
	return [total getBytes];
}
- (void) readFullBytes:(Bytes*)s pos:(int)pos len:(int)len{
	while (len > 0) {
		int k = [self readBytes:s pos:pos len:len];
		pos += k;
		len -= k;
	}
}
- (Bytes*) read:(int)nbytes{
	
	Bytes *s = [Bytes alloc:nbytes];
	int p = 0;
	while (nbytes > 0) {
		int k = [self readBytes:s pos:p len:nbytes];
		if (k == 0) throw Error.Blocked;
		p += k;
		nbytes -= k;
	}
	return s;
}
- (NSMutableString*) readUntil:(int)end{
	
	StringBuf *buf = [[StringBuf alloc] new];
	int last;
	while ( (last = [self readByte]) != end) buf.b += [NSMutableStringfromCharCode:last];
	return buf.b;
}
- (NSMutableString*) readLine{
	
	StringBuf *buf = [[StringBuf alloc] new];
	int last;
	
	NSMutableString *s;
	@try {
		while ( (last = [self readByte]) != 10) buf.b += [NSMutableStringfromCharCode:last];
		s = buf.b;
		if ([s characterAtIndex:slength - 1] == 13) s = [s substringWithRange:0 len:-1];
	}
	@catch (NSException *e) {
		s = buf.b;
		if (slength == 0) throw e;
	}
	return s;
}
- (float) readFloat{
	
	NSMutabeArray *bytes = [[NSMutableArray alloc] initWithObjects:, nil]];
	[bytes push:[self readByte]];
	[bytes push:[self readByte]];
	[bytes push:[self readByte]];
	[bytes push:[self readByte]];
	if (self.bigEndian) [bytes reverse];
	int sign = 1 -  ([bytes objectAtIndex:0] >> 7 << 1);
	int exp =  (([bytes objectAtIndex:0] << 1 & 255) | [bytes objectAtIndex:1] >> 7) - 127;
	int sig = ( ([bytes objectAtIndex:1] & 127) << 16 | [bytes objectAtIndex:2] << 8) | [bytes objectAtIndex:3];
	if (sig == 0 && exp == -127) return 0.0;
	return sign *  (1 + powf(2, -23) * sig) * powf(2, exp);
}
- (float) readDouble{
	return ((float)($this:(snd ctx.path)) throw @"not implemented"
	return $r{
		
		float* $r}
	}(self));
}
- (int) readInt8{
	int n = [self readByte];
	if (n >= 128) return n - 256;
	return n;
}
- (int) readInt16{
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	int n = ( (self.bigEndian) ? ch2 | ch1 << 8 : ch1 | ch2 << 8);
	if ( (n & 32768) != 0) return n - 65536;
	return n;
}
- (int) readUInt16{
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	return ( (self.bigEndian) ? ch2 | ch1 << 8 : ch1 | ch2 << 8);
}
- (int) readInt24{
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	int ch3 = [self readByte];
	int n = ( (self.bigEndian) ? (ch3 | ch2 << 8) | ch1 << 16 : (ch1 | ch2 << 8) | ch3 << 16);
	if ( (n & 8388608) != 0) return n - 16777216;
	return n;
}
- (int) readUInt24{
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	int ch3 = [self readByte];
	return ( (self.bigEndian) ? (ch3 | ch2 << 8) | ch1 << 16 : (ch1 | ch2 << 8) | ch3 << 16);
}
- (int) readInt31{
	int ch1; int ch2; int ch3; int ch4;
	if (self.bigEndian) {
		ch4 = [self readByte];
		ch3 = [self readByte];
		ch2 = [self readByte];
		ch1 = [self readByte];
	}
	else {
		ch1 = [self readByte];
		ch2 = [self readByte];
		ch3 = [self readByte];
		ch4 = [self readByte];
	}
	if ( (ch4 & 128) == 0 !=  ( (ch4 & 64) == 0)) throw Error.Overflow;
	return ((ch1 | ch2 << 8) | ch3 << 16) | ch4 << 24;
}
- (int) readUInt30{
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	int ch3 = [self readByte];
	int ch4 = [self readByte];
	if ( (( (self.bigEndian) ? ch1 : ch4)) >= 64) throw Error.Overflow;
	return ( (self.bigEndian) ? ((ch4 | ch3 << 8) | ch2 << 16) | ch1 << 24 : ((ch1 | ch2 << 8) | ch3 << 16) | ch4 << 24);
}
- (CppInt32__*) readInt32{
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	int ch3 = [self readByte];
	int ch4 = [self readByte];
	return ( (self.bigEndian) ? [CppInt32__ make:ch1 << 8 | ch2 b:ch3 << 8 | ch4] : [CppInt32__ make:ch4 << 8 | ch3 b:ch2 << 8 | ch1]);
}
- (NSMutableString*) readString:(int)len{
	
	Bytes *b = [Bytes alloc:len];
	[self readFullBytes:b pos:0 len:len];
	return [b toString];
}

@end
