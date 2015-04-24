//
//  GEQRCode.m
//  GEQRCodeView
//
//  Created by lerosua on 14-7-18.
//  Copyright (c) 2014年 lerosua. All rights reserved.
//

#import "GEQRCode.h"

#define isNoLessThanIOS7        ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)

enum {
	qr_margin = 3
};

@implementation GEQRCode

+ (UIImage *) generateQRCode:(NSString *) codeString withScale:(CGFloat) scale
{
    if(isNoLessThanIOS7){
        return [[self class] generateQRCodeWithString:codeString withScale:scale];
    }else{
        return nil;
    }
}


//ios7 generate QRCode
+ (UIImage *)generateQRCodeWithString:(NSString *)string withScale:(CGFloat)scale{
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:stringData forKey:@"inputMessage"];
    [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    // Render the image into a CoreGraphics image
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:[filter outputImage] fromRect:[[filter outputImage] extent]];
    
    //Scale the image usign CoreGraphics
    UIGraphicsBeginImageContext(CGSizeMake([[filter outputImage] extent].size.width * scale, [filter outputImage].extent.size.width * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    UIImage *preImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //Cleaning up .
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    
    // Rotate the image
    UIImage *qrImage = [UIImage imageWithCGImage:[preImage CGImage]
                                           scale:[preImage scale]
                                     orientation:UIImageOrientationDownMirrored];
    return qrImage;
}


@end
