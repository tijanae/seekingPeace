//
//  PoseSettingsView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/7/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class PoseSettingsView: UIView {

    lazy var poseImage: UIImageView = {
        let poseView = UIImageView()
        poseView.image = UIImage(named: "lotus")
        return poseView
    }()
    
    lazy var engTitle: UILabel = {
       let engLabel = UILabel()
        engLabel.text = "Yoga Pose: Eng Name"
        engLabel.textColor = .black
        engLabel.font = UIFont(name: "Thonburi", size: 25)
        engLabel.adjustsFontSizeToFitWidth = true
        return engLabel
    }()
    
    lazy var sanTitle: UILabel = {
       let engLabel = UILabel()
        engLabel.text = "Yoga Pose: San Name"
        engLabel.textColor = .black
        engLabel.font = UIFont(name: "Thonburi", size: 25)
        engLabel.adjustsFontSizeToFitWidth = true
        return engLabel
    }()
    
    lazy var savePlaylistButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var cancelPlaylistButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var durationLabel: UILabel = {
       let label = UILabel()
        label.text = "Duration"
        return label
    }()
    
    lazy var durationTF: UITextField = {
        let textField = UITextField()
        textField.text = "MM:SS"
        textField.backgroundColor = CrayonBox.Green.mid
        textField.borderStyle = .line
        textField.textColor = CrayonBox.White.opaque
        textField.layer.borderWidth = 2
        textField.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return textField
       }()
    
    lazy var breathReminderLabel: UILabel = {
       let label = UILabel()
        label.text = "Duration"
        return label
    }()
    
    lazy var audioReminderLabel: UILabel = {
       let label = UILabel()
        label.text = "Duration"
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
        savebuttonConstraint()
        cancelbuttonConstraint()
        poseImageConstraint()
        poseNameConstraint()
        durationLabelConstraint()
        sanNameConstraint()
        
    }
    
    private func savebuttonConstraint() {
        
        addSubview(savePlaylistButton)
        
        savePlaylistButton.translatesAutoresizingMaskIntoConstraints = false
        
        [savePlaylistButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
         savePlaylistButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 90),
         savePlaylistButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
         savePlaylistButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)].forEach {$0.isActive = true}
    }
    
    private func cancelbuttonConstraint() {
        
        addSubview(cancelPlaylistButton)
        
        cancelPlaylistButton.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelPlaylistButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
         cancelPlaylistButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 90),
         cancelPlaylistButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
         cancelPlaylistButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 35)].forEach {$0.isActive = true}
    }
    
    private func poseImageConstraint() {
        
        addSubview(poseImage)
        
        poseImage.translatesAutoresizingMaskIntoConstraints = false
        
        [poseImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
         poseImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 275),
         poseImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
         poseImage.trailingAnchor.constraint(equalTo: leadingAnchor, constant:  275)].forEach{$0.isActive = true}
    }
    
    private func poseNameConstraint() {
        addSubview(engTitle)
        
        engTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [engTitle.topAnchor.constraint(equalTo: topAnchor, constant: 325),
         engTitle.bottomAnchor.constraint(equalTo: topAnchor, constant: 375),
         engTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         engTitle.trailingAnchor.constraint(equalTo: leadingAnchor, constant:  175)].forEach{$0.isActive = true}
    }
    
    private func sanNameConstraint() {
        addSubview(sanTitle)
        
        sanTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [sanTitle.topAnchor.constraint(equalTo: topAnchor, constant: 375),
         sanTitle.bottomAnchor.constraint(equalTo: topAnchor, constant: 425),
         sanTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         sanTitle.trailingAnchor.constraint(equalTo: leadingAnchor, constant:  175)].forEach{$0.isActive = true}
    }
    
    private func durationLabelConstraint() {
        
        addSubview(durationLabel)
        
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [durationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 425),
         durationLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 475),
         durationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         durationLabel.trailingAnchor.constraint(equalTo: leadingAnchor, constant:  175)].forEach{$0.isActive = true}
    }
    
    private func durationTFConstraint() {
        
        addSubview(durationTF)
        
        durationTF.translatesAutoresizingMaskIntoConstraints = false
        
        [durationTF.topAnchor.constraint(equalTo: topAnchor, constant: 400),
         durationTF.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -280),
         durationTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250),
         durationTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -50)].forEach{$0.isActive = true}
    }

}
