//
//  PoseDetailVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/2/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit
import AVKit

class PoseDetailVC: UIViewController {
    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    
//    MARK: Data
    var poseIndex: YogaPose!
    var poseObjects = PoseDetailView()
    
    override func loadView() {
        view = poseObjects
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        loadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    
    private func loadData() {
//        poseObjects.engTitle.text = poseIndex.english_name
        poseObjects.engTitle.text = poseIndex.english_name
        poseObjects.poseImage.image = UIImage(named: "lotus")
    }
    
    private func setUpVideo() {
        
//        Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "NavasanaBoatPose", ofType: "mp4")
        
        guard bundlePath != nil else {print("Error: Bundle Path is Nil"); return}
        
//        Create URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
//        create Video Player Item
        let item = AVPlayerItem(url: url)
        
//        create the player
        videoPlayer = AVPlayer(playerItem: item)
        
//        mute the player
        videoPlayer?.isMuted = true
        
//        create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
//        adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: 55, y: 0, width: 300, height: 200)

        
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        //Make the navigation bar appear again
//        navigationController?.setNavigationBarHidden(false, animated: false)
        
        //Stop the video from playing
        videoPlayer?.pause()
        videoPlayerLayer?.player = nil
        videoPlayerLayer?.removeFromSuperlayer()
    }



}
