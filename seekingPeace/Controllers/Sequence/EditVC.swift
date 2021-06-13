//
//  EditVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/19/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit

class EditVC: UIViewController {

    private let editView = EditView()

    private let editHeaderView = EditViewHeader()

// MARK: Data

    var sequenceObjects: PlaylistPersisted!

    override func loadView() {
        view = editView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        editView.sequenceTV.dataSource = self
        editView.sequenceTV.delegate = self
        editView.sequenceTV.tableHeaderView = editHeaderView
        setUpHeader()
        setUp()
    }
//    private func

    private func setUpHeader() {
        editHeaderView.sequenceImage.image = UIImage(data: sequenceObjects.sequenceImageData)
        editHeaderView.sequenceLabel.text = sequenceObjects.playlistName
    }
    private func setUp() {
        editHeaderView.dismissSequence.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        editHeaderView.playSequence.addTarget(self, action: #selector(playSequence), for: .touchUpInside)
    }

// MARK: ObjC funcs

    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }

    @objc func playSequence() {
        let sequence = PlayVC()
        sequence.sequenceOjc = sequenceObjects
        sequence.modalPresentationStyle = .fullScreen
        present(sequence, animated: true, completion: nil)
    }

}

extension EditVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print(sequenceObjects!)
        return sequenceObjects.sequenceItem.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let data = sequenceObjects.sequenceItem[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "editSequence", for: indexPath) as? EditTVC else {fatalError("Couldnt dequeue EditTVC")}
        cell.poseLabel.text = data.yogaPose.english_name
        let cellImage = UIImage(named: "\(data.yogaPose.english_name)") ??  UIImage(named: "lotus")
        cell.poseImage.image = cellImage

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
    }

}
