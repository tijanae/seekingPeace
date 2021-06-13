//
//  PoseIndexObjects.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/30/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SequenceView: UIView {
    
//    MARK: UIOBJECTS
    
    lazy var backdrop: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "forest")
        return img
    }()
    
    lazy var playlistLabel: UILabel = {
       let label = UILabel()
        label.text = "Sequences"
        label.font = UIFont(name: "Thonburi-Bold", size: 30)
        label.textColor = .white
        return label
    }()
    
    lazy var createPlaylistButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        return button
    }()
 
    lazy var poseTableView: UITableView = {
       let poseIndex = UITableView()
        poseIndex.backgroundColor = .clear
        poseIndex.register(SequenceTVC.self, forCellReuseIdentifier: "poseData")
        return poseIndex
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        //backdropConstraint()
        //titleConstraint()
        poseTableViewConstraint()
        createPlaylistConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Constraints
    
    private func backdropConstraint() {
        
        addSubview(backdrop)
        
        backdrop.translatesAutoresizingMaskIntoConstraints = false
        
        [backdrop.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
         backdrop.leadingAnchor.constraint(equalTo: leadingAnchor),
         backdrop.trailingAnchor.constraint(equalTo: trailingAnchor),
         backdrop.bottomAnchor.constraint(equalTo: bottomAnchor)].forEach{$0.isActive = true}
    }
    
    private func titleConstraint() {
        
        addSubview(playlistLabel)
        
        playlistLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [playlistLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         playlistLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 100),
         playlistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
         playlistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)].forEach {$0.isActive = true}
    }
    
    private func poseTableViewConstraint() {
        addSubview(poseTableView)
        poseTableView.translatesAutoresizingMaskIntoConstraints = false
        
        [poseTableView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
         poseTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
         poseTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
         poseTableView.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
    }
    
    private func createPlaylistConstraint() {
        addSubview(createPlaylistButton)
        
        createPlaylistButton.translatesAutoresizingMaskIntoConstraints = false
        [createPlaylistButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         createPlaylistButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 100),
         createPlaylistButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)].forEach {$0.isActive = true}
    }
    

}


