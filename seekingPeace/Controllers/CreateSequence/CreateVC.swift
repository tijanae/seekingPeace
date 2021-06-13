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
    var flowData = [YogaPose]()

    private let createFlowView = CreateView()

    var yogiSelectedIndexPaths = [IndexPath]()

    var selectedPoses: [YogaPose] {

        return yogiSelectedIndexPaths.map {flowData[$0.row]}

    }

    override func loadView() {
        view = createFlowView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        createFlowView.createFlowCollection.dataSource = self
        createFlowView.createFlowCollection.delegate = self
        // view.backgroundColor = .darkGray
        createObjectSetUp()

    }

    override func viewDidAppear(_ animated: Bool) {
        setGradientBackground(colorBottom: UIColor(red: 8/255, green: 92/255, blue: 0/255, alpha: 1), colorTop: .white)
    }

// MARK: Private Func

    private func setGradientBackground(colorBottom: UIColor, colorTop: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = view.bounds
       self.view.layer.insertSublayer(gradientLayer, at: 0)
      }

    private func createObjectSetUp() {
        createFlowView.createButton.addTarget(self, action: #selector(createPlaylistTapped), for: .touchUpInside)
        createFlowView.dismissButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }

    @objc func createPlaylistTapped() {
        guard yogiSelectedIndexPaths.count > 0 else {
            displayInvaildRequestAlert()
            return
        }
        showPlaylistDetails()
//        print(selectedPoses)
    }

    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
//
    private func showPlaylistDetails() {
        let detailedPlaylist = EditSequenceVC()
        detailedPlaylist.poses = selectedPoses
//        print(detailedPlaylist.poses)
        detailedPlaylist.modalPresentationStyle = .fullScreen
        present(detailedPlaylist, animated: true, completion: nil)
    }

    private func loadData() {
        guard let pathToJSON = Bundle.main.path(forResource: "Yoga", ofType: "json") else {fatalError("Unexpected Error: cannot find JSON")}

        let url = URL(fileURLWithPath: pathToJSON)
        do {
            let data = try Data(contentsOf: url)
            self.flowData = try YogaPose.getYogaPoses(from: data)
        } catch {
            print(error)
            fatalError("Unexpected Error in yogaFlow")
        }
    }

    private func displayInvaildRequestAlert() {
        displayAlert(title: "Invalid Request", message: "Please select some poses")
    }

    private func displayAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

}

extension CreateVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flowData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let flowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateFlowCVC", for: indexPath) as? CreateCVC else {return UICollectionViewCell()}
        let data = flowData[indexPath.row]

        flowCell.engTitle.text = data.english_name
        flowCell.sanskritTitle.text = data.sanskrit_name

        let cellImage = UIImage(named: "\(data.english_name)") ??  UIImage(named: "lotus")
        flowCell.flowImage.image = cellImage

        return flowCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 125, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)

        if yogiSelectedIndexPaths.contains(indexPath) {
            yogiSelectedIndexPaths.removeAll(where: {$0 == indexPath})
//            print(indexPath)
            cell?.contentView.backgroundColor = CrayonBox.Black.sheer

        } else {
            yogiSelectedIndexPaths.append(indexPath)
            cell?.contentView.backgroundColor = CrayonBox.Green.mid
        }

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
