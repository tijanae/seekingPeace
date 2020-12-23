//
//  PoseIndex.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SequenceVC: UIViewController {
    
    private let sequenceView = SequenceView()

//    MARK: DATA
    var poseIndex = [YogaPose]()
    
    var savedPlaylists = [PlaylistPersisted]() {
        didSet {
            sequenceView.poseTableView.reloadData()
        }
    }
    
    override func loadView() {
        view = sequenceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        loadData()
        sequenceView.poseTableView.dataSource = self
        sequenceView.poseTableView.delegate = self
        
//        view.backgroundColor = .darkGray
  
    }
    
//    MARK:  PRIVATE FUNCS
    
    private func loadData() {
        do {
            savedPlaylists = try PlaylistPersistenceManager.manager.getPlaylist()
        } catch {
            fatalError("Could Not Get Playlist")
        }
    }
    
   

}

extension SequenceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(poseIndex.count)
        return savedPlaylists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = savedPlaylists[indexPath.row]
        
        guard let poseCell = tableView.dequeueReusableCell(withIdentifier: "poseData", for: indexPath) as? SequenceTVC else{return UITableViewCell()}
        poseCell.playlistNameLabel.text = data.playlistName
//        poseCell.sanscritTitle.text = data.sanskrit_name
        
        poseCell.poseImage.image = UIImage(named: "lotus")
        
        return poseCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
