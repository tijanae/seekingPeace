//
//  createSequenceDetail.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class createSequenceDetail: UIView {
    
//    MARK: UIOBJECTS
    
    lazy var playlistImage: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "love")
        return img
    }()
    
    var playlistName = SpTextField(placeholder: "playlist name")
    
    lazy var playlistTV: UITableView = {
        let poseTable = UITableView()
        poseTable.backgroundColor = .lightGray
        poseTable.register(SequenceDetailTVC.self, forCellReuseIdentifier: "playlistTable")
        return poseTable
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
        savebuttonConstraint()
        cancelbuttonConstraint()
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
        
        [playlistName.topAnchor.constraint(equalTo: topAnchor, constant: 255),
         playlistName.bottomAnchor.constraint(equalTo: topAnchor, constant: 280),
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
