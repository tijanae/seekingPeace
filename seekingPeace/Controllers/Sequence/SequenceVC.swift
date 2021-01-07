//
//  PoseIndex.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SequenceVC: UIViewController {
    
    weak var delegate: DeleteDelegate?
    
    private let sequenceView = SequenceView()
    private let noSequenceView = NoSequencesView()

    
    var playlistHasCount = true

//    MARK: DATA
    var poseIndex = [YogaPose]()
    
    var savedPlaylists = [PlaylistPersisted]() {
        didSet {
            sequenceView.poseTableView.reloadData()
        }
    }
    
    override func loadView() {
        loadData()
        print(savedPlaylists.count)
        guard savedPlaylists.count != 0 else { return view = noSequenceView}
        view = sequenceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        sequenceView.poseTableView.dataSource = self
        sequenceView.poseTableView.delegate = self
        objectSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadView()
    }
    
//    MARK:  PRIVATE FUNCS
        
    private func objectSetUp() {
        sequenceView.createPlaylistButton.addTarget(self, action: #selector(showCreatePlaylist), for: .touchUpInside)
        noSequenceView.createPlaylistButton.addTarget(self, action: #selector(showCreatePlaylist), for: .touchUpInside)
    }
    
    private func loadData() {
        do {
            savedPlaylists = try PlaylistPersistenceManager.manager.getPlaylist()
        } catch {
            fatalError("Could Not Get Playlist")
        }
    }
    
    
    @objc func showCreatePlaylist() {
        let createPlaylist = CreateVC()
        createPlaylist.modalPresentationStyle = .fullScreen
        present(createPlaylist, animated: true, completion: nil)
    }
    
    @objc func deletePlaylist(sender: UIButton) {
//        delegate?.deleteObject(tag: sender.tag)
        
        try? PlaylistPersistenceManager.manager.deletePlaylist(playlist: self.savedPlaylists, atIndex: sender.tag )
        self.loadData()
        loadView()
    }
   

}

extension SequenceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(" count is \(savedPlaylists.count)")
        return savedPlaylists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = savedPlaylists[indexPath.row]
        
        guard let poseCell = tableView.dequeueReusableCell(withIdentifier: "poseData", for: indexPath) as? SequenceTVC else{return UITableViewCell()}
        poseCell.playlistNameLabel.text = data.playlistName
        poseCell.poseImage.image = UIImage(named: "lotus")
//        poseCell.delegate = self
        poseCell.deleteButton.tag = indexPath.row
        poseCell.deleteButton.addTarget(self, action: #selector(deletePlaylist), for: .touchUpInside)
       
        return poseCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    
}

//extension SequenceVC: DeleteDelegate {
//
//    func deleteObject(tag: Int) {
//     let playlistTag = savedPlaylists[tag]
//        print(playlistTag)
//    }
//
//}
