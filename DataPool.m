//
//  dataPool.m
//  FaceMagic
//
//  Created by QiFeng on 8/11/15.
//  Copyright © 2015 ArthurJiang. All rights reserved.
//

#import "DataPool.h"

@implementation DataPool

static Byte* oriImg;
static Byte* refMan;
static Byte* refWoman;
static Byte* resizeImg;
static Byte* dynamicImg;

// static init class call at least once
+ (void) initialize {
    oriImg = (Byte*) calloc(DataPoolSize, sizeof(Byte));
    // TODO: recommend to init only one space for refMan and refWoman
    refMan = (Byte*) calloc(RefManSize, sizeof(Byte));
    refWoman = (Byte*) calloc(RefWomanSize, sizeof(Byte));
    resizeImg = (Byte*) calloc(StaticResizeImgSize, sizeof(Byte));
    dynamicImg = (Byte*) calloc(DynamicPoolSize, sizeof(Byte));
    
    NSLog(@"init DataPool>>>>>>>>>>>");
}

+ (Byte*) getDataRef : ( PoolDataType ) type{
    switch (type) {
        case ORIIMG:
            if( oriImg == nil) {
                oriImg = (Byte*) calloc(DataPoolSize, sizeof(Byte));
            }
            return oriImg;
        case REFMAN:
            if (refMan == nil) {
                refMan = (Byte*) calloc(RefManSize, sizeof(Byte));
            }
            return refMan;
        case REFWOMAN:
            if (refWoman == nil) {
                refWoman = (Byte*) calloc(RefWomanSize, sizeof(Byte));
            }
            return refWoman;
        case RESIZEIMG:
            if (resizeImg == nil) {
                resizeImg = (Byte*) calloc(StaticResizeImgSize, sizeof(Byte));
            }
            return resizeImg;
        case DYNIMG:
            if (dynamicImg == nil) {
                dynamicImg = (Byte*) calloc(DynamicPoolSize, sizeof(Byte));
            }
            return dynamicImg;
        
        default:
            return nil;
    }
}

// TODO: should be used at memoryWarningReceived
- (void) dealloc{
    if( oriImg != nil ) {
        free(oriImg);
        oriImg = nil;
    }
    if( refMan != nil ) {
        free(refMan);
        refMan = nil;
    }
    if( refWoman != nil ) {
        free(refWoman);
        refWoman = nil;
    }
    if( dynamicImg != nil ) {
        free(dynamicImg);
        dynamicImg = nil;
    }
    NSLog(@"DataPool is being deallocated>>>>>>>>>>>");
}

//the following two function will be called automatically when the program starts and ends.
//__attribute__((constructor))
//static void initialize_navigationBarImages() {
//    oriImg = (Byte*) calloc(DataPoolSize, sizeof(Byte));
//}
//
//__attribute__((destructor))
//static void destroy_navigationBarImages() {
//    free(refWoman);
//    refWoman = nil;
//}

@end