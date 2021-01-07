//
//  CreateView.swift
//  seekingPeace
//
//  Created by Tia Lendor on 11/5/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class CreateView: UIView {

//  MARK: UIOBJECTS
    
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Create a Sequence"
            label.textColor = .white
            return label
        }()
    
        lazy var dismissButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = CrayonBox.Green.mid
            button.layer.borderWidth = 2
            button.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            button.setTitleColor(.white, for: .normal)
            button.setTitle("cancel", for: .normal)
            return button
        }()
    
        lazy var createButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "plus"), for: .normal)
            return button
        }()
    
    
        lazy var createFlowCollection: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 5
//          layout.scrollDirection = .horizontal
            let flowCV = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
            flowCV.backgroundColor = .white
            flowCV.register(CreateCVC.self, forCellWithReuseIdentifier: "CreateFlowCVC")

            return flowCV
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleConstraint()
        flowCollectionConstraint()
        addButtonConstraint()
        dismissConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Constraints
    
    private func titleConstraint() {
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
         titleLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 125),
         titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 125),
         titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)].forEach {$0.isActive = true}
    }
    
    private func addButtonConstraint() {
        addSubview(createButton)
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        [createButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         createButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 90),
         createButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 300),
         createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }
    
    private func flowCollectionConstraint() {
        
        addSubview(createFlowCollection)
        
        createFlowCollection.translatesAutoresizingMaskIntoConstraints = false
        
        [createFlowCollection.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            createFlowCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            createFlowCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            createFlowCollection.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach {$0.isActive = true}
        
        createFlowCollection.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    }
    
    private func dismissConstraint() {
        
        addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        [dismissButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
         dismissButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 95),
         dismissButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         dismissButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -300)].forEach {$0.isActive = true}
    }
    
}
