//
//  ViewController.swift
//  ManipulateThePixels
//
//  Created by ShrawanKumar Sharma on 08/02/17.
//  Copyright © 2017 com.ManipulateThePixels. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var originalImage: UIImageView!
    @IBOutlet weak var processedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaltErrorInImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func addSaltErrorInImage() {

        processedImage.image =  OpenCVHelper.addSlat(to: originalImage.image)
        print("col and row of the image is %@ %@ ", originalImage.image?.size.width ?? 20, originalImage.image?.size.height ?? 20)
         /*
         NSLog(@" col and row of the image == \n %d %d \n" , imageMat.cols , imageMat.rows);
         equivalent to
         print("col and row of the image is %@ %@ ", originalImage.image?.size.width ?? 20, originalImage.image?.size.height ?? 20)
         */
        
    }
    


}

