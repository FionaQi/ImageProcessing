//
//  FilterWithGPU.h
//  FaceMagic
//
//  Created by QiFeng on 7/31/15.
//  Copyright © 2015 ArthurJiang. All rights reserved.
//

#ifndef FilterWithGPU_h
#define FilterWithGPU_h

#import <Foundation/Foundation.h>
#import <GPUImage.h>

@interface GPUFilter : NSObject

+ (UIImage*) getLookupFilterImage : (UIImage*) srcImage : (GPUImagePicture *) lookupImage : (CGFloat)filterMix;
+ (UIImage *)AlphaBlendingFiltering: (UIImage*) srcImage : (UIImage *) overImage : (CGFloat)filterMix;
+ (UIImage*) getSmoothToonImage : (UIImage*) srcImage;
+ (UIImage*) getSketchImage : (UIImage*) srcImage;
@end

#endif /* FilterWithGPU_h */
