//
//  YogaFlow.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class YogaFlowController: UIViewController {
    
// MARK: Data
    var flowData = [YogaPoses]()
    
    private let flowView = FlowView()
    
    override func loadView() {
        view = flowView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        flowView.flowCollection.dragDelegate = self
        flowView.flowCollection.dragInteractionEnabled = true
        flowView.flowCollection.dataSource = self
        flowView.flowCollection.delegate = self
        view.backgroundColor = .darkGray
        

    }
    
//    MARK: Private Func
    
    private func loadData() {
        guard let pathToJSON = Bundle.main.path(forResource: "Yoga", ofType: "json") else{fatalError("Unexpected Error: cannot find JSON")}
        
        let url = URL(fileURLWithPath: pathToJSON)
        do{
            let data = try Data(contentsOf: url)
            self.flowData = try YogaPoses.getYogaPoses(from: data)
        } catch {
            print(error)
            fatalError("Unexpected Error in yogaFlow")
        }
    }

}

extension YogaFlowController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 175)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flowData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let flowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlowCVC", for: indexPath) as? FlowCVC else {return UICollectionViewCell()}
        let data = flowData[indexPath.row]
        
        flowCell.engTitle.text = data.english_name
        flowCell.sanskritTitle.text = data.sanskrit_name
        
        flowCell.flowImage.image = UIImage(named: "lotus")
        
        return flowCell
    }
    
}

extension YogaFlowController: UICollectionViewDragDelegate{
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.flowData[indexPath.row]
//        what do i really need to drag in order to play content?
        let itemProvider = NSItemProvider(object: item.english_name as NSString)
        
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return[dragItem]
    }
    
    
}
