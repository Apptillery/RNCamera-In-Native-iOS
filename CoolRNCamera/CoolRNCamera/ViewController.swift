//
//  ViewController.swift
//  CoolRNCamera
//
//  Created by Alex Gibson on 3/21/17.
//  Copyright © 2017 AG. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {

    var rnCamera:RCTRootView!
    override func viewDidLoad() {
        super.viewDidLoad()
        rnCamera = RCTRootView(
            bundleURL: URL(string: "http://192.168.1.27:8081/index.ios.bundle?platform=ios"),
            moduleName: "RNCamera",
            initialProperties: ["identifier":2],
            launchOptions: nil)
        rnCamera.frame = self.view.bounds
        rnCamera.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.view.addSubview(rnCamera)
    }
    
    func segueWith(image:UIImage){
        print("The image is \(image)")
        self.performSegue(withIdentifier: "toImageDetail", sender: image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageDetail"{
            guard let dvc = segue.destination as? ImageDetailViewController else{return}
            dvc.image = sender as? UIImage
            print("segue")
        }
    }
}

