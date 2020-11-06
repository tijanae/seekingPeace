//
//  YogaView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/5/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class YogaView: UIView {
    
//    MARK: UIOBJECTS
    
    lazy var yogaCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let yogacv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        yogacv.backgroundColor = .lightGray
        yogacv.register(yogaCell.self, forCellWithReuseIdentifier: "yogaCell")
//        yogacv.dataSource = self
//        yogacv.delegate = self
        
        return yogacv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Constraints
    
    private func collectionViewConstraint() {
        addSubview(yogaCollection)
        yogaCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yogaCollection.topAnchor.constraint(equalTo: topAnchor, constant: 450),
            yogaCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            yogaCollection.widthAnchor.constraint(equalTo: widthAnchor)])
    }
    
    

}
