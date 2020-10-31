//
//  yogaCell.swift
//  seekingPeace
//
//  Created by Tia Lendor on 2/4/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class yogaCell: UICollectionViewCell {
    
//    MIC CHECK ONE TWO ONE TWO!!!
    
//    MARK: UI OBJECTS
    
    lazy var yogaImage: UIImageView =  {
        let img = UIImageView()
//        img.image = UIImage(named: "lotus")
        return img
    }()
    
    lazy var engName: UILabel = {
       let name = UILabel()
        return name
    }()
    
    lazy var sanskritName: UILabel = {
       let name = UILabel()
        return name
    }()
    
//    MARK: LIFECYCLE
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        addConstraints()
        contentView.backgroundColor = .white
        
    }
    
//    MARK: PRIVATE FUNCS
    
    private func addView() {
        contentView.addSubview(yogaImage)
        contentView.addSubview(engName)
        contentView.addSubview(sanskritName)
    }
    
    private func addConstraints() {
        constrainImageView()
        engLabelConstraint()
        sanLabelConstraint()
    }
    
    private func constrainImageView(){
        yogaImage.translatesAutoresizingMaskIntoConstraints = false
        [yogaImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
         yogaImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 44),
         yogaImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.50),
         yogaImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -44)
            ].forEach{$0.isActive = true}
    }
    
    private func engLabelConstraint() {
        engName.translatesAutoresizingMaskIntoConstraints = false
        [ engName.topAnchor.constraint(equalTo: yogaImage.bottomAnchor, constant: 20),
          engName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
          engName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)].forEach{$0.isActive = true}
    }
    
    private func sanLabelConstraint() {
        sanskritName.translatesAutoresizingMaskIntoConstraints = false
        [   sanskritName.topAnchor.constraint(equalTo: engName.bottomAnchor, constant: 15),
            sanskritName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            sanskritName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)].forEach{$0.isActive = true}
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
