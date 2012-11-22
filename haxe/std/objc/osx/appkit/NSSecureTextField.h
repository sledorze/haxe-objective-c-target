/*
        NSSecureTextField.h
        Application Kit
        Copyright (c) 1995-2011, Apple Inc.
        All rights reserved.
*/

#import <AppKit/NSTextField.h>
#import <AppKit/NSTextFieldCell.h>

extern class NSSecureTextField : NSTextField {
/*All instance variables are private*/
}
}

extern class NSSecureTextFieldCell : NSTextFieldCell {
/*All instance variables are private*/
    @private
    BOOL _echosBullets;
    BOOL _csMode;
}

- (void)setEchosBullets:(BOOL)flag;
- (BOOL)echosBullets;

}
