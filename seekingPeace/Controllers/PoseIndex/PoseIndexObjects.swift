//
//  PoseIndexObjects.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/30/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class PoseIndexView: UIView {
    
//    MARK: UIOBJECTS
 
    lazy var poseTableView: UITableView = {
       let poseIndex = UITableView()
        poseIndex.backgroundColor = .lightGray
        poseIndex.register(PoseIndexTVC.self, forCellReuseIdentifier: "poseData")
        return poseIndex
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        poseTableViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Constraints
    
    private func poseTableViewConstraint() {
        addSubview(poseTableView)
        poseTableView.translatesAutoresizingMaskIntoConstraints = false
        
        [poseTableView.topAnchor.constraint(equalTo: topAnchor),
         poseTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
         poseTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
         poseTableView.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
    }
    

}


