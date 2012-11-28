/*
 * Copyright (c) 2005-2012, The haXe Project Contributors
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

@:core_api class Sys {

	public static function print( v : Dynamic ) : Void {
		untyped __objc__("print(v)");
	}

	public static function println( v : Dynamic ) : Void {
		print(v);
		print("\n");
	}

	public static function stdin() : haxe.io.Input {
		return untyped new sys.io.FileInput(file_stdin());
	}

	public static function stdout() : haxe.io.Output {
		return untyped new sys.io.FileOutput(file_stdout());
	}

	public static function stderr() : haxe.io.Output {
		return untyped new sys.io.FileOutput(file_stderr());
	}

	public static function getChar( echo : Bool ) : Int {
		return 0;//getch(echo);
	}

	public static function args() : Array<String> untyped {
		return null;//__global__.__get_args();
	}

	public static function getEnv( s : String ):String {
		var v = null;//get_env(s);
		if( v == null )
			return null;
		return v;
	}

	public static function putEnv( s : String, v : String ) : Void {
		//put_env(s,v);
	}

	public static function sleep( seconds : Float ) : Void {
		//_sleep(seconds);
	}

	public static function setTimeLocale( loc : String ) : Bool {
		return true;//set_time_locale(loc);
	}

	public static function getCwd() : String {
		return null;//new String(get_cwd());
	}

	public static function setCwd( s : String ) : Void {
		//set_cwd(s);
	}

	public static function systemName() : String {
		return null;//sys_string();
	}

	static function escapeArgument( arg : String ) : String {
		var ok = true;
		for( i in 0...arg.length )
			switch( arg.charCodeAt(i) ) {
			case 32, 34: // [space] "
				ok = false;
			case 0, 13, 10: // [eof] [cr] [lf]
				arg = arg.substr(0,i);
			}
		if( ok )
			return arg;
		return '"'+arg.split('"').join('\\"')+'"';
	}

	public static function command( cmd : String, ?args : Array<String> ) : Int {
		if( args != null ) {
			cmd = escapeArgument(cmd);
			for( a in args )
				cmd += " "+escapeArgument(a);
		}
		return 0;//sys_command(cmd);
	}

	public static function exit( code : Int ) : Void {
		untyped __objc__("exit(code)");
	}

	public static function time() : Float {
		return 0;//sys_time();
	}

	public static function cpuTime() : Float {
		return 0;//sys_cpu_time();
	}

	public static function executablePath() : String {
		return null;//new String(sys_exe_path());
	}

	public static function environment() : Hash<String> {
		var vars:Array<String> = null;//sys_env();
		var result = new Hash<String>();
		var i = 0;
		while(i<vars.length) {
			result.set( vars[i], vars[i+1] );
			i+=2;
		}
		return result;
	}
}
