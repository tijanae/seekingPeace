//
//  EditViewHeader.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/20/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit

class EditViewHeader: UIView {

    lazy var dismissSequence: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()

    lazy var sequenceImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "leaf")
        return img
    }()

    lazy var playSequence: UIButton = {
       let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.setTitle(" Play", for: .normal)
        button.backgroundColor = CrayonBox.Green.opaque
        button.layer.cornerRadius = 10
        let xPostion: CGFloat = 125
        let yPostion: CGFloat = 275
        let elementWidth: CGFloat = 150
        let elementHeight: CGFloat = 30
        button.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        return button
    }()

    lazy var sequenceLabel: UILabel = {
       let label = UILabel()
        label.tintColor = .white
        label.text = "sequenceName"
        label.font = UIFont(name: "Noteworthy-Bold", size: 30)
        return label
    }()

    lazy var menubutton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 350))
        constraints()
        addSubview(playSequence)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func constraints() {
        dismissConstraint()
        sequenceImageConstraint()
        // playSequenceConstraint()
        sequenceLabelConstraint()
        menuConstraint()
    }

    private func dismissConstraint() {
        addSubview(dismissSequence)
        dismissSequence.translatesAutoresizingMaskIntoConstraints = false

        [dismissSequence.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
         dismissSequence.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
         dismissSequence.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
         dismissSequence.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 50)].forEach { $0.isActive = true}
    }

    private func menuConstraint() {

        addSubview(menubutton)

        menubutton.translatesAutoresizingMaskIntoConstraints = false

        [menubutton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
         menubutton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
         menubutton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
         menubutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)].forEach {$0.isActive = true}
    }

    private func sequenceImageConstraint() {

        addSubview(sequenceImage)

        sequenceImage.translatesAutoresizingMaskIntoConstraints = false

        [sequenceImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
         sequenceImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 225),
         sequenceImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         sequenceImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)].forEach {$0.isActive = true}

    }

//    private func playSequenceConstraint() {
//
//        addSubview(playSequence)
//
//        playSequence.translatesAutoresizingMaskIntoConstraints = false
//
//        [playSequence.topAnchor.constraint(equalTo: topAnchor, constant: 300),
//         playSequence.bottomAnchor.constraint(equalTo: topAnchor, constant: 325),
//         playSequence.centerXAnchor.constraint(equalTo: centerXAnchor)
////         playSequence.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 175),
////         playSequence.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 275)
//        ].forEach{$0.isActive = true}
//    }

    private func sequenceLabelConstraint() {
        addSubview(sequenceLabel)

        sequenceLabel.translatesAutoresizingMaskIntoConstraints = false

        [sequenceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 225),
         sequenceLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 275),
         sequenceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 125),
         sequenceLabel.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 325)].forEach { $0.isActive = true}
    }

}
