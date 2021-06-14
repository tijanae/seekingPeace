//
//  PoseIndex.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class SequenceVC: UIViewController {
// MARK: Views
    private let sequenceView = SequenceView()
    private let noSequenceView = NoSequencesView()
//    private let breatheAnimation = BreatheAnimation()

    var createButton: UIBarButtonItem!

// MARK: Data
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
        view.backgroundColor = .white
        sequenceView.poseTableView.dataSource = self
        sequenceView.poseTableView.delegate = self
//        objectSetUp()
        navigationItem.title = "Sequence"
        createButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showCreatePlaylist))
        createButton.tintColor = .black
        navigationItem.rightBarButtonItem = createButton
            }

    override func viewWillAppear(_ animated: Bool) {
        loadView()
    }

    override func viewDidAppear(_ animated: Bool) {
        setGradientBackground(colorBottom: UIColor(red: 50/255, green: 175/255, blue: 0/255, alpha: 1), colorTop: .white)
    }

// MARK: Private Func

    private func setGradientBackground(colorBottom: UIColor, colorTop: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = view.bounds
       self.view.layer.insertSublayer(gradientLayer, at: 0)
      }

    private func loadData() {
        do {
            savedPlaylists = try PlaylistPersistenceManager.manager.getPlaylist()
        } catch {
            fatalError("Could Not Get Playlist")
        }
    }
// MARK: OBJC Funcs

    @objc func showCreatePlaylist() {
        let createPlaylist = CreateVC()
        createPlaylist.modalPresentationStyle = .fullScreen
        present(createPlaylist, animated: true, completion: nil)
    }

    @objc func deletePlaylist(sender: UIButton) {

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

        guard let poseCell = tableView.dequeueReusableCell(withIdentifier: "poseData", for: indexPath) as? SequenceTVC else {return UITableViewCell()}
        poseCell.playlistNameLabel.text = data.playlistName
        poseCell.poseImage.image = UIImage(data: data.sequenceImageData)
//        poseCell.delegate = self
        poseCell.deleteButton.tag = indexPath.row
        poseCell.deleteButton.addTarget(self, action: #selector(deletePlaylist), for: .touchUpInside)

        return poseCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailedVC = EditVC()
        let selectedSequence = savedPlaylists[indexPath.row]
        detailedVC.sequenceObjects = selectedSequence

        detailedVC.modalPresentationStyle = .fullScreen

        self.present(detailedVC, animated: true, completion: nil)

    }

}

// extension SequenceVC: DeleteDelegate {
//
//    func deleteObject(tag: Int) {
//     let playlistTag = savedPlaylists[tag]
//        print(playlistTag)
//    }
//
// }
