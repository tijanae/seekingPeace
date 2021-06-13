//
//  EditView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/19/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit

class EditView: UIView {

// MARK: UIOBJECTS

    lazy var sequenceTV: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(EditTVC.self, forCellReuseIdentifier: "editSequence")
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func constraints() {
        sequenceTVConstraint()
    }

    private func sequenceTVConstraint() {

        addSubview(sequenceTV)

        sequenceTV.translatesAutoresizingMaskIntoConstraints = false

        [sequenceTV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        sequenceTV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        sequenceTV.leadingAnchor.constraint(equalTo: leadingAnchor),
        sequenceTV.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach {$0.isActive = true}
    }

}
