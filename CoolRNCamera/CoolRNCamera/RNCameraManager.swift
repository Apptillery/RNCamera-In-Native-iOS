//
//  RNCamera.swift
//  CoolRNCamera
//
//  Created by Alex Gibson on 3/21/17.
//  Copyright © 2017 AG. All rights reserved.
//

import UIKit
import React
import Photos

@objc (RNCameraManager)
class RNCameraManager: NSObject {
    var bridge: RCTBridge!
    
    @objc func cameraDidTakePicture(_ imageInfo:NSDictionary,reactTag: NSNumber){

        if let imagePath = imageInfo.value(forKey: "path") as? String{
            DispatchQueue.main.async {
                //target ios 8 + with photos framework
                let options = PHFetchOptions()
                options.fetchLimit = 1
                let assets =
                    PHAsset.fetchAssets(withALAssetURLs: [URL(string:imagePath)!], options: options)
                
                if let view = self.bridge.uiManager.view(forReactTag: reactTag) {
                    if let presentedViewController = view.reactViewController() as? ViewController{
                        presentedViewController.segueWith(image: self.getAssetThumbnail(asset: assets.firstObject!,targetSize: presentedViewController.view.bounds.size))
                    }
                }
            }
        }

    }
    
    func getAssetThumbnail(asset: PHAsset,targetSize:CGSize) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }

}
