//
//  FilterWithGPU.m
//  FaceMagic
//
//  Created by QiFeng on 7/31/15.
//  Copyright © 2015 ArthurJiang. All rights reserved.
//

#import "GPUFilter.h"

#define BytesPerPixel 4
#define BitsPerComponent 8


@implementation GPUFilter

+ (UIImage*) getGrayScaleImage : (UIImage*) srcImage {
    UIImage * filteredImage;
    GPUImageGrayscaleFilter *filter = [[GPUImageGrayscaleFilter alloc] init];
    filteredImage = [filter imageByFilteringImage:srcImage];
    return filteredImage;
}

+ (UIImage*) getLookupFilterImage : (UIImage*) srcImage : (GPUImagePicture *) lookupImageSource : (CGFloat)filterMix{
    UIImage * filteredImage;
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:srcImage];
    GPUImageLookupFilter *filter = [[GPUImageLookupFilter alloc] init];
    filter.intensity = filterMix;
    [stillImageSource addTarget:filter];
    [lookupImageSource addTarget:filter];
    
    [filter useNextFrameForImageCapture];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    
    //with orientation already fixed to 0 when photo is taken, cause by CPUImage got device Orientation in implementation
    filteredImage = [filter imageFromCurrentFramebufferWithOrientation:0];
    return filteredImage;
}

+ (UIImage*) getSmoothToonImage : (UIImage*) srcImage {
    GPUImageSmoothToonFilter *filter = [[GPUImageSmoothToonFilter alloc] init];
    return [filter imageByFilteringImage:srcImage];
}

+ (UIImage*) getSketchImage : (UIImage*) srcImage {
    GPUImageSketchFilter *filter = [[GPUImageSketchFilter alloc] init];
    return [filter imageByFilteringImage:srcImage];
}

+ (UIImage *)AlphaBlendingFiltering: (UIImage*) srcImage : (UIImage *) overImage : (CGFloat)filterMix {
    if (srcImage) {
        GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:srcImage];
        GPUImagePicture *overImageSource = [[GPUImagePicture alloc] initWithImage:overImage];
        
        GPUImageAlphaBlendFilter *filter = [[GPUImageAlphaBlendFilter alloc] init];
        filter.mix = filterMix;
        [stillImageSource addTarget:filter atTextureLocation:0];
        [overImageSource addTarget:filter atTextureLocation:1];
        [filter useNextFrameForImageCapture];
        
        [stillImageSource processImage];
        [overImageSource processImage];
        return [filter imageFromCurrentFramebufferWithOrientation:0];
    }
    else{
        NSLog(@"error in blending: srcImage = nil");
        return overImage;
    }
}


@end