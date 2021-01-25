//
//  PlayVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/22/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit

class PlayVC: UIViewController {
    
    private let playView = PlayView()
    
//    MARK: Data
    
    var sequenceObjects: PlaylistPersisted!
    
    override func loadView() {
        view = playView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        setTargets()

        // Do any additional setup after loading the view.
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func playPause() {
        
        playView.circleView.alpha = 1
        
        UIView.animate(withDuration: 10, delay: 0, options: [.curveLinear, .autoreverse], animations: {
            self.playView.circleView.transform = .identity
            self.playView.circleView.transform = CGAffineTransform(scaleX: 2, y: 2)
//            self.playView.circleView.
        }, completion: nil)
        
        
    }
    
//    MARK: Private Func

    private func setUpUI() {
//        playView.sequenceLabel.text = sequenceObjects.playlistName
        playView.sequenceLabel.text = "Morning Sunshine"
        playView.poseNameLabel.text = "PLANK and Something else"
    }
    
    private func setTargets() {
        playView.backButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        playView.pauseButton.addTarget(self, action: #selector(playPause), for: .touchUpInside)
    }
     

}
