//
//  RNDP3TSDK.m
//  Dp3tSdkReactNative
//
//  Created by Rodolphe Lemasquerier on 18/04/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(RNDP3TSDK, NSObject)

RCT_EXTERN_METHOD(initialize:(NSString *)appId environment:(NSString*)environment resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

@end
