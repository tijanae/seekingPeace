//
//  SettingsView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/4/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    lazy var userNickname: UILabel = {
        let label = UILabel()
        label.text = "hey Obi-Wan"
        return label
    }()

    lazy var settingsTableView: UITableView = {
       let settings = UITableView()
        settings.backgroundColor = .lightGray
        settings.register(MainSettingsTVC.self, forCellReuseIdentifier: "settings")
        return settings
    }()

    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person"), for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        nameConstraint()
        settingsTableViewConstraint()
        logoutConstraint()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func nameConstraint() {

        addSubview(userNickname)

        userNickname.translatesAutoresizingMaskIntoConstraints = false

        [userNickname.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         userNickname.bottomAnchor.constraint(equalTo: topAnchor, constant: 100),
         userNickname.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
         userNickname.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)].forEach {$0.isActive = true}
    }

    private func settingsTableViewConstraint() {

        addSubview(settingsTableView)

        settingsTableView.translatesAutoresizingMaskIntoConstraints = false

        [settingsTableView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
         settingsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
         settingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
         settingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach {$0.isActive = true}
    }

    private func logoutConstraint() {
        addSubview(logoutButton)

        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        [logoutButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         logoutButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 100),
         logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)].forEach {$0.isActive = true}
    }

}
