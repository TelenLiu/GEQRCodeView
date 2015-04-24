//
//  XHCaptureHelper.h
//  MessageDisplayExample
//
//  Created by 曾 宪华 on 14-5-25.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <Foundation/Foundation.h>

@import AVFoundation;

typedef void(^completedBlock)(void) ;
typedef void(^DidOutputSampleBufferBlock)(NSString *result);

@interface XHCaptureHelper : NSObject <AVCaptureMetadataOutputObjectsDelegate>

- (void)setDidOutputSampleBufferHandle:(DidOutputSampleBufferBlock)didOutputSampleBuffer;

- (void)showCaptureOnView:(UIView *)preview;
- (void)showCaptureOnView:(UIView *)preview complete:(completedBlock) didCompletedBlock;
@end
