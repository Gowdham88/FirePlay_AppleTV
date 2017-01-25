//
//  ViewController.swift
//  Fireplay
//
//  Created by Paramesh on 25/01/17.
//  Copyright © 2017 Paramesh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var myImages: UIImageView!
    @IBOutlet weak var popView: UIView!
    var mygifNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"]
    
    var mygif = [UIImage]()

    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        for i in 0..<mygifNames.count{
            
            
            mygif.append(UIImage(named: mygifNames[i])!)
            
        }
        
        myImages.animationImages = mygif
        myImages.animationDuration = 2.20
        self.myImages.startAnimating()

        // Do any additional setup after loading the view, typically from a nib.
        
        
        do{
            
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "fire", ofType: "mp3")!))
            
            player.prepareToPlay()
        }
        catch{
            
            print(error)
        }
        player.numberOfLoops = -1
        player.play()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fireOnoff(_ sender: Any) {
        
        if player.isPlaying {
            player.pause()
        }
        else{
            player.numberOfLoops = -1
            player.play()
            
        }
        
        
    }


}

