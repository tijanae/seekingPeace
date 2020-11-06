//
//  FlowView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/5/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class FlowView: UIView {

//  MARK: UIOBJECTS
        lazy var flowCollection: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal
            let flowCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            flowCV.backgroundColor = .purple
            flowCV.register(FlowCVC.self, forCellWithReuseIdentifier: "FlowCVC")

            return flowCV
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        flowCollectionConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Constraints
    
    private func flowCollectionConstraint() {
        addSubview(flowCollection)
        flowCollection.translatesAutoresizingMaskIntoConstraints = false
        [
            flowCollection.topAnchor.constraint(equalTo: topAnchor),
            flowCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            flowCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            flowCollection.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach {$0.isActive = true}
    
    }
    
}
