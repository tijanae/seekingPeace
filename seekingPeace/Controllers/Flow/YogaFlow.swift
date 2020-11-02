//
//  YogaFlow.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class YogaFlow: UIViewController {
    
// MARK: Data
    var flowData = [YogaPoses]()
    
//MARK: UIOBJECTS
    lazy var flowCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
        let flowCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        flowCV.backgroundColor = .purple
        flowCV.register(FlowCVC.self, forCellWithReuseIdentifier: "FlowCVC")
        flowCV.dataSource = self
        flowCV.delegate = self
        return flowCV
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow

    }
    
//    MARK: Private Func
    
    private func loadData() {
        
    }
    
    private func addViews() {
        
    }
    
    private func addConstraint() {
        
    }
    



}

extension YogaFlow: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
