//
//  ImageDetailViewController.swift
//  CoolRNCamera
//
//  Created by Alex Gibson on 3/21/17.
//  Copyright © 2017 AG. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imgView.image = image
    }

    @IBAction func closeDidPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
