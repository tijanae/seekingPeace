//
//  createSequenceDetail.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class EditSequenceView: UIView {

    // MARK: UIOBJECTS

    lazy var playlistTV: UITableView = {
        let poseTable = UITableView()
        poseTable.backgroundColor = .clear
        poseTable.register(EditSequenceTVC.self, forCellReuseIdentifier: "playlistTable")
        return poseTable
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func constraints() {
        playlistTVConstraint()

    }

    private func playlistTVConstraint() {
        addSubview(playlistTV)

        playlistTV.translatesAutoresizingMaskIntoConstraints = false

        //        [playlistTV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        //         playlistTV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        //         playlistTV.leadingAnchor.constraint(equalTo: leadingAnchor),
        //         playlistTV.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}

        NSLayoutConstraint.activate(
            [playlistTV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
             playlistTV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
             playlistTV.leadingAnchor.constraint(equalTo: leadingAnchor),
             playlistTV.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }

}
