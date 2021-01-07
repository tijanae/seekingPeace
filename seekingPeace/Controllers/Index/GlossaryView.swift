//
//  GlossaryView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/2/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class GlossaryView: UIView {
    
//    MARK: UIOBJECTS
    
    lazy var glossaryTableView: UITableView = {
        let poseIndex = UITableView()
        poseIndex.backgroundColor = .lightGray
        poseIndex.register(GlossaryTVC.self, forCellReuseIdentifier: "poseData")
        return poseIndex
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        glossaryTVConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Constraints
    
    private func glossaryTVConstraint() {
        
        addSubview(glossaryTableView)
        
        glossaryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        [glossaryTableView.topAnchor.constraint(equalTo: topAnchor),
         glossaryTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
         glossaryTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
         glossaryTableView.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
    }
    
}
