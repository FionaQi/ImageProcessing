//
//  DataPool.h
//  FaceMagic
//
//  Created by QiFeng on 8/11/15.
//  Copyright © 2015 ArthurJiang. All rights reserved.
//

#ifndef DataPool_h
#define DataPool_h
#import <Foundation/Foundation.h>

const NSInteger DataPoolSize = 31961088;
const NSInteger RefManSize = 3760128; // = 864 * 1088 * 4;
const NSInteger RefWomanSize = 3760128; // = 864 * 1088 * 4;
const NSInteger StaticResizeImgSize = 6553600;
const NSInteger DynamicPoolSize = 6553600; // = 1280 * 1280 * 4;

typedef enum {
    ORIIMG = 0,
    REFMAN = 1,
    REFWOMAN = 2,
    RESIZEIMG = 3,
    DYNIMG = 4
} PoolDataType;

@interface DataPool: NSObject
{

}

+ (void) initialize;
+ (Byte*) getDataRef : ( PoolDataType ) type;
- (void) dealloc;

@end


#endif /* DataPool_h */
