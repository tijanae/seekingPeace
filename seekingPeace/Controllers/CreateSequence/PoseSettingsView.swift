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
        return engLabel
    }()
    
    lazy var savePlaylistButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = CrayonBox.Green.mid
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("save", for: .normal)
        return button
    }()
    
    lazy var cancelPlaylistButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = CrayonBox.Green.mid
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("cancel", for: .normal)
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
        
    }
    
    private func savebuttonConstraint() {
        
        addSubview(savePlaylistButton)
        
        savePlaylistButton.translatesAutoresizingMaskIntoConstraints = false
        
        [savePlaylistButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         savePlaylistButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 90),
         savePlaylistButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 275),
         savePlaylistButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)].forEach {$0.isActive = true}
    }
    
    private func cancelbuttonConstraint() {
        
        addSubview(cancelPlaylistButton)
        
        cancelPlaylistButton.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelPlaylistButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         cancelPlaylistButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 90),
         cancelPlaylistButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         cancelPlaylistButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -275)].forEach {$0.isActive = true}
    }
    
    private func poseImageConstraint() {
        
        addSubview(poseImage)
        
        poseImage.translatesAutoresizingMaskIntoConstraints = false
        
        [poseImage.topAnchor.constraint(equalTo: topAnchor, constant: 100),
         poseImage.bottomAnchor.constraint(equalTo: topAnchor, constant: 275),
         poseImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         poseImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -50)].forEach{$0.isActive = true}
    }
    
    private func poseNameConstraint() {
        addSubview(engTitle)
        
        engTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [engTitle.topAnchor.constraint(equalTo: topAnchor, constant: 275),
         engTitle.bottomAnchor.constraint(equalTo: topAnchor, constant: 300),
         engTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
         engTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -150)].forEach{$0.isActive = true}
    }
    
    private func durationLabelConstraint() {
        
        addSubview(durationLabel)
        
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [durationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 400),
         durationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -280),
         durationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         durationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -250)].forEach{$0.isActive = true}
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
