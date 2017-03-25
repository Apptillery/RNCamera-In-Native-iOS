//
//  RNCameraManager.m
//  CoolRNCamera
//
//  Created by Alex Gibson on 3/21/17.
//  Copyright © 2017 AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(RNCameraManager, NSObject)

RCT_EXTERN_METHOD(cameraDidTakePicture:(nonnull NSDictionary *)imageInfo reactTag:(nonnull NSNumber *)reactTag)

@end
