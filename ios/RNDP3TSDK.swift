//
//  RNDP3TSDK.swift
//  Dp3tSdkReactNative
//
//  Created by Rodolphe Lemasquerier on 18/04/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import DP3TSDK

@objc(RNDP3TSDK)
class RNDP3TSDK: NSObject {
    @objc
    func initialize(_ appId: String, environment: String, resolver: RCTPromiseResolveBlock, rejecter: RCTPromiseRejectBlock) -> Void {
        do {
            try DP3TTracing.initialize(with: appId, enviroment: Enviroment.dev)
            resolver(true)
        } catch {
            print("DP3TSDK initialization error: \(error.localizedDescription)")
            rejecter("DP3TSDK", "DP3TSDK initialization error", error)
        }
    }
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
