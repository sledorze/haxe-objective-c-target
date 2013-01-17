## Overview

Objective-C target can build Xcode projects with pure objective-c code from a Haxe project. The target can use Cocoa and CocoaTouch frameworks to build iPhone and Mac applications

> NOTE:  is still in it's early stages of development, so is not safe to use, but if you want to help you can do tests and report errors:

## Installation

Checkout the oficial Haxe sources from googlecode

Clone the ObjC target from git somewhere in your computer:

	git clone git@github.com:ralcr/haxe-objective-c-target.git

Navigate to haxe directory:

	cd haxe

Build Haxe with:

	make clean
	make haxe

On Mac you can run the build.sh script that will compile Haxe but will run the tests and demos as well:

	./build.sh

## Getting started

The main class should be of this form, everything else is ignored

	public static function main() {
		return new UIApplicationMain ( AppDelegate );
	}

And the AppDelegate.hx should conform with the UIApplicationDelegate. The main entry point is:

	public function applicationDidFinishLaunchingWithOptions (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool
	
You should start building your app from this point up
