//
//  CreateFlowCVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/31/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class CreateFlowCVC: UICollectionViewCell {
    
    
//    MARK: UI OBJECTS
    
    lazy var flowImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "lotus")
        return img
    }()
    
    lazy var engTitle: UILabel = {
       let label = UILabel()
        label.contentMode = .scaleToFill
        label.numberOfLines = 2
        return label
    }()
    
    lazy var sanskritTitle: UILabel = {
       let label = UILabel()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        contentView.backgroundColor = .lightGray
    }
    
    
    private func addConstraints() {
        flowImageConstraint()
        engTitleConstraint()
//        sanskritTitleConstraint()
    }
    
    private func flowImageConstraint() {
        
        contentView.addSubview(flowImage)
        
        flowImage.translatesAutoresizingMaskIntoConstraints = false
        [flowImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
         flowImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
         flowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
         flowImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -45)
            ].forEach{$0.isActive = true}
        
    }
    
    private func engTitleConstraint() {
        
        addSubview(engTitle)
        
        engTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [ engTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 55),
          engTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
          engTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
          engTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)].forEach{$0.isActive = true}
    }
    
    private func sanskritTitleConstraint() {
        
        addSubview(sanskritTitle)
        
        sanskritTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [ sanskritTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 75),
          sanskritTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
          sanskritTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)].forEach{$0.isActive = true}
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
