/* * Copyright (c) 2005, The haXe Project Contributors * All rights reserved. * Redistribution and use in source and binary forms, with or without * modification, are permitted provided that the following conditions are met: * *   - Redistributions of source code must retain the above copyright *     notice, this list of conditions and the following disclaimer. *   - Redistributions in binary form must reproduce the above copyright *     notice, this list of conditions and the following disclaimer in the *     documentation and/or other materials provided with the distribution. * * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH * DAMAGE. */import objc.foundation.NSArray;import objc.foundation.NSRange;/*	TODO: check CFArray, maybe is better than NSArray */// @:category meta is for Objc only and will transform the class into a category.// The category name is Array and the class is predefined to NSMutableArray// So Array is actually a NSMutableArray and you can call any method if you cast it or use untyped@:category("NSMutableArray") /*@:core_api*/ @:final class Array<T> {	public var length (default, null) : Int;	public function new () : Void {}	public function concat (a : Array<T>) : Array<T> {		return untyped this.arrayByAddingObjectsFromArray ( a );	}	public function copy () : Array<T> {		return untyped Array.arrayWithArray ( this );	}	public function iterator () : Iterator<T> {		return untyped {			a : this,			p : 0,			hasNext : function() {				return __this__.p < __this__.a.length;			},			next : function() {				var i = __this__.a[__this__.p];				__this__.p += 1;				return i;			}		};	}	public function insert ( pos : Int, x : T ) : Void {		//untyped this.insertObject (x, pos);		untyped __objc__("[self insertObject:x atIndex:pos]");	}	public function join ( sep : String ) : String {		return untyped this.componentsJoinedByString( sep );	}	public function toString () : String {		return "[" + untyped this.componentsJoinedByString(",") + "]";	}	public function pop () : Null<T> {		if( this.length == 0 )			return null;		var theLastObject :T = untyped this.lastObject();		untyped this.removeLastObject();		return theLastObject;	}	public function push (x:T) : Int {		untyped this.addObject ( x );		return untyped this.count();	}	public function unshift (x : T) : Void {		untyped __objc__("[self insertObject:x atIndex:0]");	}	public function remove (x : T) : Bool {		var containsObject :Bool = untyped this.containsObject ( x );		if (containsObject) untyped this.removeObject ( x );		return containsObject;	}	public function reverse () : Void {		var reverseArray = untyped this.reverseObjectEnumerator().allObjects();/*		NSMutableArray * reverseArray = [NSMutableArray arrayWithCapacity:[self count]]; 		for (id element in [myArray reverseObjectEnumerator]) {		    [reverseArray addObject:element];		}*/	}	public function shift () : Null<T> {		if (untyped this.count() > 0) {			var obj = untyped this.objectAtIndex ( 0 );			untyped this.removeObjectAtIndex ( 0 );			return obj;		}		return null;	}	public function slice( pos : Int, ?end : Int ) : Array<T> {		return splice (pos, end-pos);	}	public function sort(f:T->T->Int) : Void {			}	public function splice( pos : Int, len : Int ) : Array<T> {		// TODO: Test which method is faster		var newArray :Array<T> = untyped this.subarrayWithRange ( new NSRange (pos, len));		untyped this.removeObjectsInArray ( newArray );/*		nativeArray.removeObjectsInRange ( new NSRange (pos, len));*/		return untyped Array.arrayWithArray ( newArray );	}}