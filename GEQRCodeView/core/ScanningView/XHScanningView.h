//
//  XHScanningView.h
//  MessageDisplayExample
//
//  Created by 曾 宪华 on 14-5-25.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XHScanningStyle) {
    XHScanningStyleQRCode = 0,
    XHScanningStyleBook,
    XHScanningStyleStreet,
    XHScanningStyleWord,
};

@interface XHScanningView : UIView

@property (nonatomic, assign, readonly) XHScanningStyle scanningStyle;

- (void)transformScanningTypeWithStyle:(XHScanningStyle)style;
- (void)scanning;
@end
