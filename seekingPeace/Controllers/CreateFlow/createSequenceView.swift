//
//  createSequenceDetail.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class createSequenceView: UIView {
    
    //    MARK: UIOBJECTS
    
    
    lazy var playlistTV: UITableView = {
        let poseTable = UITableView()
        poseTable.backgroundColor = .clear
        poseTable.register(CreateSequenceTVC.self, forCellReuseIdentifier: "playlistTable")
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
        
        NSLayoutConstraint.activate([playlistTV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                                     playlistTV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                                     playlistTV.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     playlistTV.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }
    
    
    
}

//extension createSequenceView {
//
//    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
//        gradientLayer.locations = [0, 1]
//        gradientLayer.frame = self.bounds
//
//        self.layer.insertSublayer(gradientLayer, at: 0)
//
//    }
//}
