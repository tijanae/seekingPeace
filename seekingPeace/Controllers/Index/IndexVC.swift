//
//  IndexVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/2/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class IndexVC: UIViewController {
    
//    MARK: DATA
    var poseIndex = [YogaPoses]()
    
    private let indexView = IndexView()
    
    override func loadView() {
        view = indexView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        loadData()
        indexView.indexTableView.dataSource = self
        indexView.indexTableView.delegate = self
        
        view.backgroundColor = .darkGray
        
    }
    
//    MARK:  PRIVATE FUNCS
    

    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "Yoga", ofType: "json") else {
            fatalError("Unexpected Error: cannot find JSON")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do{
            let data = try Data(contentsOf: url)
            self.poseIndex = try YogaPoses.getYogaPoses(from: data)
        } catch {
            print(error)
            fatalError("Unexpected Error in pose index")
        }
    }
    
    
    
}

extension IndexVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(poseIndex.count) // 48
        return poseIndex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = poseIndex[indexPath.row]
        
        guard let poseCell = tableView.dequeueReusableCell(withIdentifier: "poseData", for: indexPath) as? SequenceTVC else{return UITableViewCell()}
        poseCell.engTitle.text = data.english_name
        poseCell.sanscritTitle.text = data.sanskrit_name
        poseCell.poseImage.image = UIImage(named: "lotus")
        
        return poseCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = PoseDetailVC()
        let selectedPose = poseIndex[indexPath.row]
        detailedVC.poseIndex = selectedPose
//        detailedVC.modalPresentationStyle = .fullScreen
//        present(detailedVC, animated: true, completion: nil)
        self.present(detailedVC, animated: true, completion: nil)
    }
    
}
