//
//  CreateSequenceTVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/7/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class EditSequenceTVC: UITableViewCell {

// MARK: UI OBJECTS

    lazy var poseImage: UIImageView = {
        let poseView = UIImageView()
        poseView.image = UIImage(named: "lotus")
        return poseView
    }()

    lazy var engTitle: UILabel = {
        let engLabel = UILabel()
        engLabel.text = "Yoga Pose: Eng Name"
        engLabel.adjustsFontSizeToFitWidth = true
        return engLabel
    }()

    lazy var sanscritTitle: UILabel = {
        let sanscritLabel = UILabel()
        sanscritLabel.text = "Yoga Pose: Sanscrit Name"
        sanscritLabel.adjustsFontSizeToFitWidth = true
        return sanscritLabel
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .clear
        addViews()
        addConstraints()

    }

    private func addViews() {
        contentView.addSubview(poseImage)
        contentView.addSubview(engTitle)
        contentView.addSubview(sanscritTitle)

    }

    private func addConstraints() {
        poseImageConstraint()
        engTitleConstraint()
        sanscritTitleConstraint()
    }

    private func poseImageConstraint() {

        poseImage.translatesAutoresizingMaskIntoConstraints = false

        [poseImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
         poseImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
         poseImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -250),
         poseImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)].forEach {$0.isActive = true}
    }

    private func engTitleConstraint() {

        engTitle.translatesAutoresizingMaskIntoConstraints = false

        [engTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
         engTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
         engTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 175),
         engTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }

    private func sanscritTitleConstraint() {

        sanscritTitle.translatesAutoresizingMaskIntoConstraints = false

        [sanscritTitle.topAnchor.constraint(equalTo: engTitle.bottomAnchor, constant: -40),
         sanscritTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 175),
         sanscritTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }

}
