//
//  ViewController.swift
//  ShakeGestureRecogniser
//
//  Created by cagdas on 15.12.2018.
//  Copyright © 2018 cagdas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let images = ["1", "2", "3"]
    
    var animal:[Animal] = []
    var player:AVAudioPlayer = AVAudioPlayer()
    
    var currentImage = 0
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        if event?.subtype == UIEvent.EventSubtype.motionShake
        {
            self.imageView.alpha = 0
            UIView.animate(withDuration: 1.0, animations: {
                self.imageView.alpha = 1.0
            })
            
            imageView.image = UIImage(named: animal[currentImage].Key + ".jpg")
            
            do
            {
                let audioPath = Bundle.main.path(forResource: animal[currentImage].Key, ofType: "mp3")
                try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
                
                player.play()
                
            }
            catch
            {
                //ERROR
            }
            
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
        
        let animal1 = Animal()
        animal1.Key = "cat"
        animal.append(animal1)
        
        let animal2 = Animal()
        animal2.Key = "dog"
        animal.append(animal2)
        
        let animal3 = Animal()
        animal3.Key = "lion"
        animal.append(animal3)
        
    }

}

class Animal {
    var Key:String = ""
    
}

