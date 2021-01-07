//
//  CreateSequenceVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class CreateSequenceVC: UIViewController {
    
//    MARK: DATA
    
    var poses: [YogaPose]!
    
    var savedPlaylists = [PlaylistPersisted]()
    
    var savedPlaylistNames = [String]()
    
//    var poseCell = poses
    
    private let sequenceDetailView = createSequenceView()
    
    private let sequenceHeaderView = CreateSequenceHeaderView()
    
    
    
    override func loadView() {
        view = sequenceDetailView
        loadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceDetailView.playlistTV.dataSource = self
        sequenceDetailView.playlistTV.delegate = self
//        view.backgroundColor = .lightGray
        sequenceDetailView.playlistTV.tableHeaderView = sequenceHeaderView
        setUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setGradientBackground(colorBottom: UIColor(red: 8/255, green: 92/255, blue: 0/255, alpha: 1), colorTop: .black)
    }
    
//    MARK: Private Func
    
    private func setGradientBackground(colorBottom: UIColor, colorTop: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = view.bounds
       self.view.layer.insertSublayer(gradientLayer, at: 0)
      }
    
    
    private func setUp() {
        sequenceHeaderView.savePlaylistButton.addTarget(self, action: #selector(tryCreatePlaylist), for: .touchUpInside)
        sequenceHeaderView.cancelPlaylistButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        sequenceHeaderView.playlistName.addTarget(self, action: #selector(deleteTextPlaceholder), for: .editingDidBegin)
    }
    
    private func loadData() {
        do {
            savedPlaylists = try PlaylistPersistenceManager.manager.getPlaylist()
        } catch {
            fatalError("Could Not Get Playlist")
        }
        
        savedPlaylistNames = savedPlaylists.map {$0.playlistName}
        print(savedPlaylistNames)
        
        
    }
    
//    MARK: ObjC funcs
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func deleteTextPlaceholder() {
        sequenceHeaderView.playlistName.text = ""
    }
    
    @objc func tryCreatePlaylist() {
        guard sequenceHeaderView.playlistName.text != "" else {
            print("Error: No PlaylistName")
            return
        }
        
        guard !savedPlaylistNames.contains(sequenceHeaderView.playlistName.text!) else {
            print("need a different name")
            return
        }
 
        
        guard let playlistName = sequenceHeaderView.playlistName.text else{
            return
        }
        
        var sequenceItems = [SequenceItem]()
        for pose in poses {
            let sequenceItem = SequenceItem(poseDuration: 300, hasAudio: false, yogaPose: pose)
            sequenceItems.append(sequenceItem)
        }
        let playlist = PlaylistPersisted(playlistName: playlistName, sequenceItem: sequenceItems)
        DispatchQueue.global(qos: .utility).async {
            try? PlaylistPersistenceManager.manager.savePlaylist(playlistData: playlist)
        }
        dismiss(animated: true, completion: nil)
    }


    




}

extension CreateSequenceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(poses)
        return poses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = poses[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playlistTable", for: indexPath) as? CreateSequenceTVC else {return UITableViewCell()}
    
        cell.engTitle.text = data.english_name
//        cell.sanscritTitle = data.sanskrit_name
        cell.poseImage.image = UIImage(named: "lotus")

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = PoseSettingsVC()
        let selectedPose = poses[indexPath.row]
        detailedVC.poseData = selectedPose
        
        detailedVC.modalPresentationStyle = .fullScreen
        
        self.present(detailedVC, animated: true, completion: nil)
    }
    

    
    
}


