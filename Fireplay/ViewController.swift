//
//  ViewController.swift
//  Fireplay
//
//  Created by Paramesh on 25/01/17.
//  Copyright © 2017 Paramesh. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import CoreImage



class ViewController: UIViewController {

    @IBOutlet var forwardSlider: UIView!
    @IBOutlet var brightView: UIView!
     
    @IBOutlet var viewupDown: UIView!
    
    
    @IBOutlet var videoView: VideoPlay!
    
    
    @IBOutlet var brightnessBtn: UILabel!
    
    @IBOutlet var speedBtn: UILabel!
    
    @IBOutlet var popView1: UIView!

    var player:AVAudioPlayer = AVAudioPlayer()
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.brightnessBtn.isHidden = true
        self.speedBtn.isHidden = true
        self.viewupDown.isHidden = true
        popView1.isHidden = true
       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        self.view.addGestureRecognizer(tapGesture)
      
        self.SetUpSound()
        
//        playmyVideo(myString: "normal")
        
        
        
        
        
    }
    
    
    
    func playmyVideo(myString: String) {
        
        
        
        //        videoPlayer.URL = Bundle.main.url(forResource: myString, withExtension: "mp4")!
        
        //NSURL(string: "http://uploadingit.com/file/pkgz6mplwtodlzl6/Mac%20OS%20X%20Snow%20Leopard%20Intro%20Movie%20HD.mp4") as URL?
        
        let bundle: Bundle = Bundle.main
        let videoPlayer: String = bundle.path(forResource: "normal", ofType: "mp4")!
        let movieUrl : NSURL = NSURL.fileURL(withPath: videoPlayer) as NSURL
        
        videoView.playVideoWithURL(url: movieUrl)
        
        
        
        
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        avPlayer.pause()
        player.pause()
        paused = true
        
       
            
        }
    
    func handleTap(sender: UITapGestureRecognizer) {
        
        if self.viewupDown.isHidden {
            
            self.viewupDown.isHidden = false
            popView1.isHidden   = false
            
        } else {
            
            self.viewupDown.isHidden = true
            popView1.isHidden = true
            
            
        }
        
    }

    

    
    @IBAction func fireOnoff(_ sender: Any) {
        if player.isPlaying {
            
            player.pause()
            
        } else {
            
            player.numberOfLoops = -1
            player.play()
            
        }

        
        
    }
    @IBAction func brightPressed(_ sender: Any) {
        self.popView1.layer.borderWidth = 1.0
        
        self.popView1.layer.borderColor = UIColor(red:216/255.0, green:216/255.0, blue:216/255.0, alpha: 1.0).cgColor
        
        popView1.layer.cornerRadius = 15
        forwardSlider.isHidden = true
        if popView1.isHidden == true {
             brightView.isHidden = false
            popView1.isHidden = false
        } else {
            
            popView1.isHidden = true
           
            brightView.isHidden = true
        }
    }

    
        
    

    @IBAction func fastForward(_ sender: Any) {
        self.popView1.layer.borderWidth = 1.0
        self.popView1.layer.borderColor = UIColor(red:216/255.0, green:216/255.0, blue:216/255.0, alpha: 1.0).cgColor
        popView1.layer.cornerRadius = 15
        brightView.isHidden = true
        if popView1.isHidden == true {
            forwardSlider.isHidden = false
            popView1.isHidden = false
        } else {
            
            popView1.isHidden = true
            forwardSlider.isHidden = true
        }
    }

    func SetUpSound() {
        
        if let path = Bundle.main.path(forResource: "fire", ofType: "mp3") {
            let filePath = NSURL(fileURLWithPath:path)
            player = try! AVAudioPlayer.init(contentsOf: filePath as URL)
            player.numberOfLoops = -1 //logic for infinite loop
            player.prepareToPlay()
            player.play()
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        try!audioSession.setCategory(AVAudioSessionCategoryPlayback, with: AVAudioSessionCategoryOptions.duckOthers)
    }
    

}





