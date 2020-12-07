//
//  PoseDetailVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/2/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class PoseDetailVC: UIViewController {
    
//    MARK: Data
    var poseIndex: YogaPoses!
    var poseObjects = PoseDetailView()
    
    override func loadView() {
        view = poseObjects
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        loadData()
    }
    
    private func loadData() {
//        poseObjects.engTitle.text = poseIndex.english_name
        poseObjects.engTitle.text = poseIndex.english_name
        poseObjects.poseImage.image = UIImage(named: "lotus")
    }
    



}
