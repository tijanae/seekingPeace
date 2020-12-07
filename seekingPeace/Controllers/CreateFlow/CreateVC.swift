//
//  CreateVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class CreateVC: UIViewController {
    
// MARK: Data
    var flowData = [YogaPoses]()
    
    private let createFlowView = CreateView()
    
    var yogiPoses = [String]()
//    var yogiSelectedIndex = [IndexPath]()
//    var yogiSelectedData = [Int]()
    
    override func loadView() {
        view = createFlowView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        createFlowView.createFlowCollection.allowsMultipleSelection = true
        createFlowView.createFlowCollection.dataSource = self
        createFlowView.createFlowCollection.delegate = self
        view.backgroundColor = .darkGray
        
        
//        createFlowView.createFlowCollection.dragDelegate = self
//        createFlowView.createFlowCollection.dragInteractionEnabled = true
    }
    
//    func createObjectSetUp() {
//        createFlowView.createButton.addTarget(self, action: #selector(validateData), for: .touchUpInside)
//    }
//    
//    @objc func validateData() {
//        guard yogiSelectedData != nil else {
//            print("please select some poses")
//            createFlowView.createButton.backgroundColor = .darkGray
//            createFlowView.createButton.isEnabled = false
//            return
//        }
//        createFlowView.createButton.isEnabled = true
//        createFlowView.createButton.backgroundColor = CrayonBox.Green.mid
//        
//    }
//    
//    @objc func showPlaylistDetails() {
//        let detailedPlaylist = createSequenceVC()
//        detailedPlaylist.poseIds = yogiSelectedData
//        
//        detailedPlaylist.modalPresentationStyle = .fullScreen
//        present(detailedPlaylist, animated: true, completion: nil)
//        
//    }
    
    
    
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

extension CreateVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flowData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let flowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateFlowCVC", for: indexPath) as? CreateFlowCVC else {return UICollectionViewCell()}
        let data = flowData[indexPath.row]
        
        flowCell.engTitle.text = data.english_name
        flowCell.sanskritTitle.text = data.sanskrit_name
        
        flowCell.flowImage.image = UIImage(named: "lotus")
        
        return flowCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 175)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        

        collectionView.reloadData()
    }
    
}




/*
extension CreateVC: UICollectionViewDragDelegate{
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.flowData[indexPath.row]
//        what do i really need to drag in order to play content?
        let itemProvider = NSItemProvider(object: item.english_name as NSString)
        
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return[dragItem]
    }
    
    
}
*/
