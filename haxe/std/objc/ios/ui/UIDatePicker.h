//
//  UIDatePicker.h
package objc.ios.ui;
//
//  Copyright (c) 2006-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIControl.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(NSInteger, UIDatePickerMode) {
    UIDatePickerModeTime,           // Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
    UIDatePickerModeDate,           // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
    UIDatePickerModeDateAndTime,    // Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
    UIDatePickerModeCountDownTimer  // Displays hour and minute (e.g. 1 | 53)
};

extern class UIDatePicker : UIControl, implements NSObject>

	public var  UIDatePickerMode datePickerMode;             // default is UIDatePickerModeDateAndTime

	public var (nonatomic,retain) NSLocale      *locale;                // default is [NSLocale currentLocale]. setting nil returns to default
public var    NSCalendar    *calendar;              // default is [NSCalendar currentCalendar]. setting nil returns to default
	public var (nonatomic,retain) NSTimeZone    *timeZone;              // default is nil. use current time zone or time zone from calendar

	public var (nonatomic,retain) NSDate        *date;                  // default is current date when picker created. Ignored in countdown timer mode. for that mode, picker starts at 0:00

	public var (nonatomic,retain) NSDate        *minimumDate;           // specify min/max date range. default is nil. When min > max, the values are ignored. Ignored in countdown timer mode
	public var (nonatomic,retain) NSDate        *maximumDate;           // default is nil
	public var         NSTimeInterval countDownDuration;     // for UIDatePickerModeCountDownTimer, ignored otherwise. default is 0.0. limit is 23:59 (86,399 seconds)
	public var         NSInteger      minuteInterval;        // display minutes wheel with interval. interval must be evenly divided into 60. default is 1. min is 1, max is 30

	public function setDate:(NSDate *)date animated:(BOOL)animated;           // if animated is YES, animate the wheels of time to display the new date

}
