//
//  PoseIndexObjects.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/30/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class PoseIndexObjects: UIViewController {
    
//    MARK: UIOBJECTS
    
    
    lazy var poseTableView: UITableView = {
       let poseIndex = UITableView()
        poseIndex.backgroundColor = .lightGray
        poseIndex.register(PoseIndexTVC.self, forCellReuseIdentifier: "poseData")
        return poseIndex
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()

        // Do any additional setup after loading the view.
    }
    
    private func addViews() {
        view.addSubview(poseTableView)
    }
    
    private func addConstraints() {
        poseTableViewConstraint()
    }
    
    private func poseTableViewConstraint() {
        poseTableView.translatesAutoresizingMaskIntoConstraints = false
        
        [poseTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         poseTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         poseTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         poseTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)].forEach{$0.isActive = true}
    }
    

}


