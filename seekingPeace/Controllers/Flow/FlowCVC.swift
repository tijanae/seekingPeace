//
//  FlowCVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/31/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class FlowCVC: UICollectionViewCell {
    
    
//    MARK: UI OBJECTS
    
    lazy var flowImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "lotus")
        return img
    }()
    
    lazy var engTitle: UILabel = {
       let label = UILabel()
        return label
    }()
    
    lazy var sanskritTitle: UILabel = {
       let label = UILabel()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        addConstraints()
        contentView.backgroundColor = .white
    }
    
    private func addView() {
        contentView.addSubview(flowImage)
        contentView.addSubview(engTitle)
        contentView.addSubview(sanskritTitle)
    }
    
    private func addConstraints() {
        flowImageConstraint()
        engTitleConstraint()
        sanskritTitleConstraint()
    }
    
    private func flowImageConstraint() {
        flowImage.translatesAutoresizingMaskIntoConstraints = false
        [flowImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
         flowImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
         flowImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.50),
         flowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -44)
            ].forEach{$0.isActive = true}
        
    }
    
    private func engTitleConstraint() {
        engTitle.translatesAutoresizingMaskIntoConstraints = false
        [ engTitle.topAnchor.constraint(equalTo: flowImage.bottomAnchor, constant: 20),
          engTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
          engTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)].forEach{$0.isActive = true}
    }
    
    private func sanskritTitleConstraint() {
        sanskritTitle.translatesAutoresizingMaskIntoConstraints = false
        [ sanskritTitle.topAnchor.constraint(equalTo: flowImage.bottomAnchor, constant: 20),
          sanskritTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
          sanskritTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)].forEach{$0.isActive = true}
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
