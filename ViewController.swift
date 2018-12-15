//
//  ViewController.swift
//  ShakeGestureRecogniser
//
//  Created by cagdas on 15.12.2018.
//  Copyright © 2018 cagdas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let images = ["1", "2", "3"]
    var currentImage = 0
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        if event?.subtype == UIEvent.EventSubtype.motionShake
        {
            print ("SHAKE")
            imageView.image = UIImage(named: images[currentImage] + ".jpg")
            
            if (currentImage == images.count-1)
            {
                currentImage = 0
            }
            else
            {
                currentImage += 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

