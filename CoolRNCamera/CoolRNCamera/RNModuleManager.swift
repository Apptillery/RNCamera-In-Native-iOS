//
//  MixerReactModule.swift
//  Mixer
//
//  Created by Alex Gibson on 3/17/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import Foundation
import React

class RNModuleManager : NSObject{
    
    var bridge: RCTBridge?
    static let sharedInstance = RNModuleManager()
    
    func createBridgeIfNeeded() -> RCTBridge {
        if bridge == nil {
            bridge = RCTBridge.init(delegate: self, launchOptions: nil)
        }
        return bridge!
    }
    
    func viewForModule(_ moduleName: String, initialProperties: [String : Any]?) -> RCTRootView {
        let viewBridge = createBridgeIfNeeded()
        let rootView: RCTRootView = RCTRootView(
            bridge: viewBridge,
            moduleName: moduleName,
            initialProperties: initialProperties)
        return rootView
    }
    
}

extension RNModuleManager: RCTBridgeDelegate {
    //development
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        return URL(string: "http://192.168.1.27:8081/index.ios.bundle?platform=ios")
    }
    //production
    // to use this change product scheme->edit Schema > buildConfiguration ->Release
//    func sourceURL(for bridge: RCTBridge!) -> URL! {
//        return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
//    }
}
