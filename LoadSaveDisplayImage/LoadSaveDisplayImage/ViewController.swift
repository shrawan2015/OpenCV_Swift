//
//  ViewController.swift
//  LoadSaveDisplayImage
//
//  Created by ShrawanKumar Sharma on 08/02/17.
//  Copyright © 2017 com.LoadSaveDisplayImage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var versionName: UILabel!
    @IBOutlet weak var processedImage: UIImageView!
    @IBOutlet weak var originalImage: UIImageView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
    versionName.text = OpenCVHelper.returnOpenCVVersion()
    processedImage.image = OpenCVHelper.makeGrayscale(originalImage.image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

