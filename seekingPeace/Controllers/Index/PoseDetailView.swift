//
//  PoseDetailView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/2/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class PoseDetailView: UIView {

//  MARK: UI OBJECTS
    
    lazy var poseImage: UIImageView = {
        let poseView = UIImageView()
        poseView.image = UIImage(named: "lotus")
        return poseView
    }()
    
    lazy var engTitle: UILabel = {
       let engLabel = UILabel()
        engLabel.text = "Yoga Pose: Eng Name"
        return engLabel
    }()
    
    lazy var sanscritTitle: UILabel = {
       let sanscritLabel = UILabel()
        sanscritLabel.text = "Yoga Pose: Sanscrit Name"
        return sanscritLabel
    }()
    
    lazy var muscleLabel: UILabel = {
       let label = UILabel()
        label.text = "Yoga Pose: Sanscrit Name"
        return label
    }()
    
//    MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: PrivateData
    
    private func constraints() {
        poseImageConstraint()
        engLabelConstraint()
    }
    
    private func poseImageConstraint() {
        addSubview(poseImage)
        
        poseImage.translatesAutoresizingMaskIntoConstraints = false
        
        [poseImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         poseImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         poseImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
         poseImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -500)].forEach{$0.isActive = true}
    }
    
    private func engLabelConstraint() {
        
        addSubview(engTitle)
        
        engTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [engTitle.topAnchor.constraint(equalTo: topAnchor, constant: -200),
         engTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 175),
         engTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
         engTitle.bottomAnchor.constraint(equalTo:bottomAnchor,constant: 25)].forEach{$0.isActive = true}
        
    }
    
}
