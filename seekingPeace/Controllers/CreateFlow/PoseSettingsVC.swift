//
//  PoseSettingsVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/7/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class PoseSettingsVC: UIViewController {
    
    var poseData: YogaPose!
    var poseSettingObject = PoseSettingsView()
    
    override func loadView() {
        view = poseSettingObject
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadData()
        setUp()

        // Do any additional setup after loading the view.
    }
    
    private func setUp() {
        poseSettingObject.cancelPlaylistButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    private func loadData() {
        poseSettingObject.engTitle.text = poseData.english_name
        print(poseData.english_name)
        poseSettingObject.poseImage.image = UIImage(named: "plant")
        
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }


}
