//
//  SequenceTVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/30/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SequenceTVC: UITableViewCell {
    
//    MARK: UI OBJECTS
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 110))
        view.backgroundColor = CrayonBox.Green.mid
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 1
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var poseImage: UIImageView = {
       let poseView = UIImageView()
        poseView.image = UIImage(named: "lotus")
        poseView.layer.cornerRadius = frame.height / 2
        poseView.clipsToBounds = true
        return poseView
    }()
    
    lazy var playlistNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.text = "Yoga Pose: Eng Name"
        return label
    }()
    
    lazy var sanscritTitle: UILabel = {
       let sanscritLabel = UILabel()
        sanscritLabel.textColor = .white
        sanscritLabel.text = "Yoga Pose: Sanscrit Name"
        return sanscritLabel
    }()
    
    lazy var deleteButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
//        button.addTarget(self, action: #selector(deletePlaylist), for: .touchUpInside)
        return button
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play"), for: .normal)
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        addViews()
        addConstraints()

    }
    

    
    private func addViews() {
        contentView.addSubview(backView)
        contentView.addSubview(poseImage)
        contentView.addSubview(playlistNameLabel)
//        contentView.addSubview(sanscritTitle)
        contentView.addSubview(deleteButton)
        
    }
    
    private func addConstraints() {
        backViewConstraint()
        poseImageConstraint()
        playlistNameLabelConstraint()
//        sanscritTitleConstraint()
        deleteConstraint()
    }
    
    private func backViewConstraint() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        [backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
         backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
         backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
         backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)].forEach{$0.isActive = true}
    }
    
    private func poseImageConstraint() {
        poseImage.translatesAutoresizingMaskIntoConstraints = false
        
        [poseImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
         poseImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
         poseImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -275),
//         trailing is prob excessive- start here if issue
         poseImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)].forEach{$0.isActive = true}
    }
    
    private func playlistNameLabelConstraint() {
        playlistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        [playlistNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
         playlistNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 175),
         playlistNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)].forEach{$0.isActive = true}
    }
    
    private func sanscritTitleConstraint() {
        sanscritTitle.translatesAutoresizingMaskIntoConstraints = false
        [sanscritTitle.topAnchor.constraint(equalTo: playlistNameLabel.bottomAnchor, constant: -40),
         sanscritTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 175),
         sanscritTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)].forEach{$0.isActive = true}
    }
    
    private func deleteConstraint() {
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        [deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
         deleteButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
         deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
         deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)].forEach {$0.isActive = true}
    }
    

}
