//
//  createSequenceDetail.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class createSequenceDetail: UIView {
    
    lazy var playlistImage: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "plant")
        return img
    }()
    
    var playlistName = SpTextField(placeholder: "playlist name")
    
    lazy var playlistTV: UITableView = {
        let poseIndex = UITableView()
        poseIndex.backgroundColor = .lightGray
        poseIndex.register(SequenceTVC.self, forCellReuseIdentifier: "playlistPoses")
        return poseIndex
    }()
    
    
    lazy var savePlaylistButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = CrayonBox.Green.mid
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("create", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints() {
        playlistImageConstraint()
        playlistNameConstraint()
        playlistTVConstraint()
    }
    
    private func savebuttonConstraint() {
        addSubview(savePlaylistButton)
        
        savePlaylistButton.translatesAutoresizingMaskIntoConstraints = false
        
        [savePlaylistButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         savePlaylistButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 90),
         savePlaylistButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 275),
         savePlaylistButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)].forEach {$0.isActive = true}
    }
    
    private func playlistImageConstraint() {
        
        addSubview(playlistImage)
        
        playlistImage.translatesAutoresizingMaskIntoConstraints = false
        
        [playlistImage.topAnchor.constraint(equalTo: topAnchor, constant: 100),
         playlistImage.bottomAnchor.constraint(equalTo: topAnchor, constant: 250),
         playlistImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         playlistImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -50)].forEach{$0.isActive = true}
        
    }
    
    private func playlistNameConstraint() {
        addSubview(playlistName)
        
        playlistName.translatesAutoresizingMaskIntoConstraints = false
        
        [playlistName.topAnchor.constraint(equalTo: topAnchor, constant: 250),
         playlistName.bottomAnchor.constraint(equalTo: topAnchor, constant: 275),
         playlistName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
         playlistName.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -150)].forEach{$0.isActive = true}
        
    }
    
    private func playlistTVConstraint() {
        addSubview(playlistTV)
        
        playlistTV.translatesAutoresizingMaskIntoConstraints = false
        
        [playlistTV.topAnchor.constraint(equalTo: topAnchor, constant: 300),
         playlistTV.bottomAnchor.constraint(equalTo: bottomAnchor),
         playlistTV.leadingAnchor.constraint(equalTo: leadingAnchor),
         playlistTV.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
    }



}
