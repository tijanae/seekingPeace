//
//  DetailedView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/30/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class DetailedView: UIView {

//    MARK: UIOBJECTS
    
    lazy var poseImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "lotus")
        return img
    }()
    
    lazy var poseEngName: UILabel = {
        let label = UILabel()
        label.textColor = CrayonBox.Black.opaque
        return label
    }()
    
    lazy var poseSanName: UILabel = {
        let label = UILabel()
        label.textColor = CrayonBox.Black.opaque
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints() {
        imageConstraint()
        poseEngNameConstraint()
        poseSanNameConstraint()
    }
    
    private func imageConstraint() {
        addSubview(poseImage)
        
        poseImage.translatesAutoresizingMaskIntoConstraints = false
        
        [poseImage.topAnchor.constraint(equalTo: topAnchor, constant: 100),
         poseImage.leadingAnchor.constraint(equalTo: leftAnchor, constant: 75),
         poseImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
         poseImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 300)].forEach{$0.isActive = true}
    }
    
    private func poseEngNameConstraint() {
        
        addSubview(poseEngName)
        
        poseEngName.translatesAutoresizingMaskIntoConstraints = true
        
        [poseEngName.topAnchor.constraint(equalTo: poseImage.bottomAnchor, constant: 50),
         poseEngName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
         poseEngName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),
         poseEngName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100)].forEach{$0.isActive = true}
    }
    
    private func poseSanNameConstraint() {
        
        addSubview(poseSanName)
        
        poseSanName.translatesAutoresizingMaskIntoConstraints = true
        
        [poseSanName.topAnchor.constraint(equalTo: poseImage.bottomAnchor, constant: 100),
         poseSanName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
         poseSanName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),
         poseSanName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100)].forEach{$0.isActive = true}
    }

}
