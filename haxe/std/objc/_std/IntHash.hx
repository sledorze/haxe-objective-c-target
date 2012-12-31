/*
 * Copyright (c) 2005, The haXe Project Contributors
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

@:category("NSMutableDictionary") @:core_api class IntHash<T> {
	
	public function new() : Void {
		
	}

	public function set( key : Int, value : T ) : Void {
		untyped this.setObject (value, key);
	}

	public function get( key : Int ) : Null<T> {
		return untyped this.objectForKey ( key );
	}

	public function exists( key : Int ) : Bool {
		return untyped this.objectForKey ( key ) != null;
	}

	public function remove( key : Int ) : Bool {
		return untyped this.removeObjectForKey ( key );
	}

	public function keys() : Iterator<Int> {
		var a:Array<Int> = untyped this.allKeys();
		return a.iterator();
	}

	public function iterator() : Iterator<T> {
		var a:Array<Dynamic> = untyped this.allValues();
		return a.iterator();
	}

	public function toString() : String {
		return untyped this.description();
	}

}
