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
    func startTracing(_ resolver: RCTPromiseResolveBlock, rejecter: RCTPromiseRejectBlock) -> Void {
        do {
            try DP3TTracing.startTracing()
            resolver(true)
        } catch {
            print("DP3TSDK start tracing error: \(error.localizedDescription)")
            rejecter("DP3TSDK", "DP3TSDK initialization error", error)
        }
    }
    
    @objc
    func stopTracing(_ resolver: RCTPromiseResolveBlock, rejecter: RCTPromiseRejectBlock) -> Void {
        DP3TTracing.stopTracing()
        resolver(true)
    }
    
    /// Triggers sync with the backend to refresh the exposed list
    /// - Parameter callback: callback
    @objc
    func sync(_ resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) -> Void {
        DP3TTracing.sync { syncResponse in
            do {
                try syncResponse.get()
                resolver(true)
            } catch {
                print("Could not sync tracing with backend")
                rejecter("DP3TSDK", "Could not sync tracing with backend: \(error.localizedDescription)", error)
            }
        }
    }
    
    /// get the current status of the SDK
    /// - Parameter callback: callback
    @objc
    func status(_ resolver: RCTPromiseResolveBlock, rejecter: RCTPromiseRejectBlock) -> Void {
        DP3TTracing.status { statusResponse in
            do {
                let tracingStatus = try statusResponse.get()
                var rnStatus: [String:Any] = [:]
                rnStatus["lastSync"] = tracingStatus.lastSync?.description
                rnStatus["numberOfHandshakes"] = tracingStatus.numberOfHandshakes
                switch(tracingStatus.infectionStatus) {
                case .exposed:
                    rnStatus["infectionStatus"] = "exposed"
                    break
                case .healthy:
                    rnStatus["infectionStatus"] = "healthy"
                    break
                case .infected:
                    rnStatus["infectionStatus"] = "infected"
                    break
                }
                resolver(rnStatus)
                
            } catch {
                print("Could not get tracing status")
                rejecter("DP3TSDK", "Could not get tracing status", error)
            }
        }
    }
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
