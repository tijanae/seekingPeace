//
//  SequenceTVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/30/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SequenceTVC: UITableViewCell {
    
//    weak var delegate: DeleteDelegate?
    
    var index = Int()
    
//    MARK: UI OBJECTS
    
    lazy var poseImage: UIImageView = {
       let poseView = UIImageView()
        poseView.image = UIImage(named: "lotus")
        return poseView
    }()
    
    lazy var playlistNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Yoga Pose: Eng Name"
        return label
    }()
    
    lazy var sanscritTitle: UILabel = {
       let sanscritLabel = UILabel()
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
        addViews()
        addConstraints()

    }
    
//    @objc func deletePlaylist() {
//        delegate?.deleteObject(tag: <#T##Int#>)
//
//        try? PlaylistPersistenceManager.manager.deletePlaylist(playlist: self.savedPlaylists, atIndex: )
////        self.loadData()
////        loadView()
//    }
    
    private func addViews() {
        contentView.addSubview(poseImage)
        contentView.addSubview(playlistNameLabel)
//        contentView.addSubview(sanscritTitle)
        contentView.addSubview(deleteButton)
        
    }
    
    private func addConstraints() {
        poseImageConstraint()
        playlistNameLabelConstraint()
//        sanscritTitleConstraint()
        deleteConstraint()
    }
    
    private func poseImageConstraint() {
        poseImage.translatesAutoresizingMaskIntoConstraints = false
        
        [poseImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
         poseImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
         poseImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -275),
//         trailing is prob excessive- start here if issue
         poseImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)].forEach{$0.isActive = true}
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
         deleteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 275),
         deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
         deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)].forEach {$0.isActive = true}
    }
    

}