//
//  MainSettingsTVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/4/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit

class MainSettingsTVC: UITableViewCell {
    
    lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings Text"
        return label
    }()


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        settingsLabelConstraint()
        // Configure the view for the selected state
    }
    
    private func settingsLabelConstraint() {
        
        contentView.addSubview(settingsLabel)
        
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [settingsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
         settingsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 175),
         settingsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)].forEach{$0.isActive = true}
    }

}
