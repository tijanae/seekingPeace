//
//  EditTVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/19/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit

class EditTVC: UITableViewCell {
    
    lazy var poseLabel: UILabel = {
        let label = UILabel()
        label.text = "random data"
        return label
    }()
    
    lazy var poseImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "lotus")
        return img
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        labelConstraint()
        poseImageConstraint()
        // Configure the view for the selected state
    }
    
    private func labelConstraint() {
        
        contentView.addSubview(poseLabel)
        
        poseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [poseLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
         poseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 175),
         poseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)].forEach{$0.isActive = true}
    }
    
    private func poseImageConstraint() {
        
        contentView.addSubview(poseImage)
        
        poseImage.translatesAutoresizingMaskIntoConstraints = false
        
        [poseImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
         poseImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
         poseImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -250),
         poseImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)].forEach{$0.isActive = true}
    }

}
