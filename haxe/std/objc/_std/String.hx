/*
 * Copyright (C)2005-2012 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
/**
	The basic String class.
	
	A haxe String is immutable, it is not possible to modify individual
	characters. No method of this class changes the state of [this] String.
	
	Strings can be constructed using the string literal syntax "string value".
	
	String can be concatenated by using the + operator. If an operand is not a
	String, it is passed through Std.string() first.
**/
@:category("NSMutableString") @:core_api class String {

	/**
		The number of characters in [this] String.
	**/
	public var length(default,null) : Int;

	/**
		Creates a copy from a given String.
	**/
	public function new(string:String) : Void {}

	/**
		Returns a String where all characters of [this] String are upper case.
		
		Affects the characters [a-z]. Other characters remain unchanged.
	**/
	public function toUpperCase() : String {return null;}

	/**
		Returns a String where all characters of [this] String are lower case.
		
		Affects the characters [A-Z]. Other characters remain unchanged.
	**/
	public function toLowerCase() : String {return null;}

	/**
		Returns the character at position [index] of [this] String.
		
		If [index] is negative or exceeds [this].length, the empty String ""
		is returned.
	**/
	public function charAt(index : Int) : String {return null;}

	/**
		Returns the character code at position [index] of [this] String.
		
		If [index] is negative or exceeds [this].length, null is returned.
		
		To obtain the character code of a single character, "x".code can be used
		instead to inline the character code at compile time. Note that this
		only works on String literals of length 1.
	**/
	public function charCodeAt( index : Int) : Null<Int> {return null;}

	/**
		Returns the position of the leftmost occurence of [str] within [this]
		String.
		
		If [startIndex] is given, the search is performed within the substring
		of [this] String starting from [startIndex]. Otherwise the search is
		performed within [this] String. In either case, the returned position
		is relative to the beginning of [this] String.
		
		If [str] cannot be found, -1 is returned.
	**/
	public function indexOf( str : String, ?startIndex : Int ) : Int {
		startIndex = ( startIndex == null ) ? 0 : startIndex;
		untyped __objc__("NSRange range = [self rangeOfString:str options:NSLiteralSearch range:NSMakeRange(startIndex,self.length-startIndex)];
	if ( range.location != NSNotFound ) {
		return range.location;
	}");
		return -1;
	}

	/**
		Returns the position of the rightmost occurence of [str] within [this]
		String.
		
		If [startIndex] is given, the search is performed within the substring
		of [this] String from 0 to [startIndex]. Otherwise the search is
		performed within [this] String. In either case, the returned position
		is relative to the beginning of [this] String.
		
		If [str] cannot be found, -1 is returned.
	**/
	public function lastIndexOf( str : String, ?startIndex : Int ) : Int {
		startIndex = ( startIndex == null ) ? 0 : startIndex;
		untyped __objc__("NSRange range = [self rangeOfString:str options:NSBackwardsSearch range:NSMakeRange(startIndex,self.length-startIndex)];
	if ( range.location != NSNotFound ) {
		return range.location;
	}");
		return -1;
	}

	/**
		Splits [this] String at each occurence of [delimiter].
		
		If [delimiter] is the empty String "", [this] String is split into an
		Array of [this].length elements, where the elements correspond to the
		characters of [this] String.
		
		If [delimiter] is not found within [this] String, the result is an Array
		with one element, which equals [this] String.
		
		If [delimiter] is null, the result is unspecified.
		
		Otherwise, [this] String is split into parts at each occurence of
		[delimiter]. If [this] String starts (or ends) with [delimiter}, the
		result Array contains a leading (or trailing) empty String "" element.
		Two subsequent delimiters also result in an empty String "" element.
	**/
	public function split( delimiter : String ) : Array<String> {return null;}

	/**
		Returns [len] characters of [this] String, starting at position [pos].
		
		If [len] is omitted, all characters from position [pos] to the end of
		[this] String are included.
		
		If [pos] is negative, its values is calculated from the end	of [this]
		String by [this].length + [pos]. If this yields a negative value, 0 is
		used instead.
		
		If [len] is negative, the result is unspecified.
	**/
	public function substr( pos : Int, ?len : Int ) : String {
		if( len == 0 ) return "";
		var sl = length;

		if( len == null ) len = sl;

		if( pos == null ) pos = 0;
		if( pos != 0 && len < 0 ){
			return "";
		}

		if( pos < 0 ){
			pos = sl + pos;
			if( pos < 0 ) pos = 0;
		}else if( len < 0 ){
			len = sl + len - pos;
		}

		if( pos + len > sl ){
			len = sl - pos;
		}

		if( pos < 0 || len <= 0 ) return "";
		
		return untyped __objc__("[self substringFromIndex:pos]");
		return untyped __objc__("[self substringWithRange:NSMakeRange(pos,len)]");
	}

	/**
		Returns the part of [this] String from [startIndex] to [endIndex].
		
		If [endIndex] is omitted, [this].length is used instead.
		
		If [startIndex] or [endIndex] are negative, 0 is used instead.
		
		If [startIndex] exceeds [endIndex], they are swapped.
	**/
	public function substring( startIndex : Int, ?endIndex : Int ) : String {
		if (endIndex == null) {
			endIndex = length;
		} else if ( endIndex < 0 ) {
			endIndex = 0;
		} else if ( endIndex > length ) {
			endIndex = length;
		}

		if ( startIndex < 0 ) {
			startIndex = 0;
		} else if ( startIndex > length ) {
			startIndex = length;
		}

		if ( startIndex > endIndex ) {
			var tmp = startIndex;
			startIndex = endIndex;
			endIndex = tmp;
		}

		return substr( startIndex, endIndex - startIndex );
	}

	/**
		Returns the String itself.
	**/
	public function toString() : String {return null;}

	/**
		Returns the String corresponding to the character code [code].
		
		If [code] is negative or has another invalid value, the result is
		unspecified.
	**/	
	static public function fromCharCode( code : Int ) : String {
		return untyped __objc__("[NSString stringWithFormat: @\"%C\", code]");
	}
}