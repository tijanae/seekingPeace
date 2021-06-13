//
//  PlayView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/22/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit
//import SwiftUI

class PlayView: UIView {

    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var sequenceLabel: UILabel = {
        let label = UILabel()
        label.text = "sequence name"
        label.font = UIFont(name: "Noteworthy-Bold", size: 30)
        label.tintColor = .black
        return label
    }()
    
//    lazy var circleView: UIBezierPath = {
//        let circle = UIBezierPath(arcCenter: .zero, radius: UIScreen.main.bounds.size.width, startAngle: 0, endAngle: 2, clockwise: true)
//        circle.fill(with: UI, alpha: <#T##CGFloat#>)
//        return circle
//    }()
    
    lazy var circleView: UIView = {
        let view = UIView(frame: CGRect(x: 83, y: 300, width: 250, height: 250))
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = view.frame.width / 2
//      view.clipsToBounds = true
      return view
    }()
    
    lazy var poseNameLabel: UILabel = {
       let label = UILabel()
        label.tintColor = .black
        label.text = "poseName"
        return label
    }()
    
    lazy var rewindButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "backward"), for: .normal)
        button.tintColor = .black
        return button
    }()

    lazy var pauseButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "playpause"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var forwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var poseListButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "doc.plaintext"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
        addSubview(circleView)
//        addSubview(UIHostingController(rootView: BreatheAnimation()))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Private Func
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        circleView.layer.cornerRadius = circleView.frame.width / 2
//    }
    
    private func constraints() {
        backConstraint()
        sequenceNameConstraint()
        //circleConstraint()
        poseNameConstraints()
        rewindConstraint()
        pauseConstraint()
//        forwardConstraint()
//        poseListConstraint()
    }
    
    private func backConstraint() {
        addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        [backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
         backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 75),
         backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
         backButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 75)].forEach{$0.isActive = true}
    }
    
    private func sequenceNameConstraint() {
        
        addSubview(sequenceLabel)
        
        sequenceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [sequenceLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
         sequenceLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
         sequenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//         sequenceLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -300)
        ].forEach{$0.isActive = true}
    }
    
//    private func circleConstraint() {
//
//        addSubview(circleView)
//
//        circleView.translatesAutoresizingMaskIntoConstraints = false
//
//        [circleView.topAnchor.constraint(equalTo: topAnchor, constant: 400),
//         circleView.bottomAnchor.constraint(equalTo: topAnchor, constant: 600),
//
//        ].forEach{$0.isActive = true}
//    }
    
    private func poseNameConstraints() {
        
        addSubview(poseNameLabel)
        
        poseNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [poseNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 125),
         poseNameLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 175),
         poseNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//         poseNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 300)
        ].forEach{$0.isActive = true}
        
    }
    
    private func rewindConstraint() {
        
        addSubview(rewindButton)
        
        rewindButton.translatesAutoresizingMaskIntoConstraints = false
        
        [rewindButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150),
         rewindButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -75),
         rewindButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
         rewindButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100)].forEach{$0.isActive = true}
        
    }
    
    private func pauseConstraint() {
        addSubview(pauseButton)
        
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        
        [pauseButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150),
         pauseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -75),
         pauseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
         pauseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150)].forEach{$0.isActive = true}
    }
    
    private func forwardConstraint() {
        
    }
    
    private func poseListConstraint() {
        
    }
    
    
}
