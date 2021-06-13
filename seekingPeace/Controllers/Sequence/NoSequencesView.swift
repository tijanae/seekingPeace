//
//  NoSequencesView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/24/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class NoSequencesView: UIView {

    lazy var sequenceRequestTitle: UILabel = {
        let label = UILabel()
        label.text = "Please Create Playlist"
        label.font = UIFont(name: "Thonburi-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        return label
    
    }()
    
    lazy var createPlaylistButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .white
        titleConstraint()
        createPlaylistConstraint()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//    MARK: Constraints
    
    private func titleConstraint() {
        
        addSubview(sequenceRequestTitle)
        
        sequenceRequestTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [sequenceRequestTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
         sequenceRequestTitle.centerXAnchor.constraint(equalTo: centerXAnchor)].forEach {$0.isActive = true}
    }
    
    private func createPlaylistConstraint() {
        addSubview(createPlaylistButton)
        
        createPlaylistButton.translatesAutoresizingMaskIntoConstraints = false
        [createPlaylistButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         createPlaylistButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 100),
         createPlaylistButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)].forEach {$0.isActive = true}
    }

}
