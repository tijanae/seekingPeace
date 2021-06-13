//
//  EditSequenceHeaderView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/17/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class EditSequenceHeaderView: UIView {

// MARK: UIOBJECTS

    lazy var playlistImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "leaf")
        return img
    }()

    var playlistName = SpTextField(placeholder: "playlist name")

    lazy var savePlaylistButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
//        button.backgroundColor = CrayonBox.Green.mid
//        button.layer.borderWidth = 2
//        button.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
//        button.setTitleColor(.white, for: .normal)
//        button.setTitle("save", for: .normal)
        return button
    }()

    lazy var cancelPlaylistButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
//        button.backgroundColor = CrayonBox.Green.mid
//        button.layer.borderWidth = 2
//        button.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
//        button.setTitleColor(.white, for: .normal)
//        button.setTitle("cancel", for: .normal)
        return button
    }()

    lazy var sequenceImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "camera"), for: .normal)
        button.tintColor = .black
        return button
    }()

        override init(frame: CGRect) {
            super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
            constraints()

        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func constraints() {
            playlistImageConstraint()
            playlistNameConstraint()
            savebuttonConstraint()
            cancelbuttonConstraint()
            sequenceImageConstraint()
        }

        private func savebuttonConstraint() {

            addSubview(savePlaylistButton)

            savePlaylistButton.translatesAutoresizingMaskIntoConstraints = false

            [savePlaylistButton.topAnchor.constraint(equalTo: topAnchor),
             savePlaylistButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 50),
             savePlaylistButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
             savePlaylistButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)].forEach {$0.isActive = true}
        }

        private func cancelbuttonConstraint() {

            addSubview(cancelPlaylistButton)

            cancelPlaylistButton.translatesAutoresizingMaskIntoConstraints = false

            [cancelPlaylistButton.topAnchor.constraint(equalTo: topAnchor),
             cancelPlaylistButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 50),
             cancelPlaylistButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             cancelPlaylistButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 40)].forEach {$0.isActive = true}
        }

        private func playlistImageConstraint() {

            addSubview(playlistImage)

            playlistImage.translatesAutoresizingMaskIntoConstraints = false

            [playlistImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
             playlistImage.bottomAnchor.constraint(equalTo: topAnchor, constant: 250),
             playlistImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
             playlistImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)].forEach {$0.isActive = true}

        }

        private func sequenceImageConstraint() {

            addSubview(sequenceImage)

            sequenceImage.translatesAutoresizingMaskIntoConstraints = false

            [sequenceImage.topAnchor.constraint(equalTo: playlistImage.topAnchor, constant: 10),
             sequenceImage.bottomAnchor.constraint(equalTo: playlistImage.bottomAnchor, constant: 10),
             sequenceImage.leadingAnchor.constraint(equalTo: playlistImage.leadingAnchor, constant: 5),
             sequenceImage.trailingAnchor.constraint(equalTo: playlistImage.trailingAnchor, constant: -5)].forEach {$0.isActive = true}

        }

        private func playlistNameConstraint() {
            addSubview(playlistName)

            playlistName.translatesAutoresizingMaskIntoConstraints = false

            [playlistName.topAnchor.constraint(equalTo: topAnchor, constant: 260),
             playlistName.bottomAnchor.constraint(equalTo: topAnchor, constant: 285),
             playlistName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
             playlistName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -75)].forEach {$0.isActive = true}

        }

}
