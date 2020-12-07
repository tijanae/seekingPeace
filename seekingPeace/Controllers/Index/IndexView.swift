//
//  IndexView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/2/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class IndexView: UIView {
    
//    MARK: UIOBJECTS
    
    lazy var indexTableView: UITableView = {
        let poseIndex = UITableView()
        poseIndex.backgroundColor = .lightGray
        poseIndex.register(SequenceTVC.self, forCellReuseIdentifier: "poseData")
        return poseIndex
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        indexTVConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Constraints
    
    private func indexTVConstraint() {
        
        addSubview(indexTableView)
        
        indexTableView.translatesAutoresizingMaskIntoConstraints = false
        
        [indexTableView.topAnchor.constraint(equalTo: topAnchor),
         indexTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
         indexTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
         indexTableView.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
    }
    
}
