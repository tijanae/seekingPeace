//
//  createSequenceVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class createSequenceVC: UIViewController {
    
//    MARK: DATA
    
    var poses: [YogaPose]!
    
//    var poseCell = poses
    
    private let sequenceDetailView = createSequenceDetail()
    
    override func loadView() {
        view = sequenceDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceDetailView.playlistTV.dataSource = self
        sequenceDetailView.playlistTV.delegate = self
        view.backgroundColor = .lightGray
        setUp()
    }
    
    private func setUp() {
//        sequenceDetailView.savePlaylistButton.addTarget
        sequenceDetailView.cancelPlaylistButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tryCreatePlaylist() {
        guard let playlistName = sequenceDetailView.playlistName.text else{
            print("Error: No PlaylistName")
            return
        }
        
        
    }
    




}

extension createSequenceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return poses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = poses[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playlistTable", for: indexPath) as? SequenceDetailTVC else {return UITableViewCell()}
    
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
