//
//  PoseIndex.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class PoseIndexController: UIViewController {

//    MARK: DATA
    var poseIndex = [YogaPoses]()
    
    private let poseView = PoseIndexView()
    
    override func loadView() {
        view = poseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        loadData()
        poseView.poseTableView.dataSource = self
        poseView.poseTableView.delegate = self
        
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

extension PoseIndexController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poseIndex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = poseIndex[indexPath.row]
        
        guard let poseCell = tableView.dequeueReusableCell(withIdentifier: "poseData", for: indexPath) as? PoseIndexTVC else{return UITableViewCell()}
        poseCell.engTitle.text = data.english_name
        poseCell.sanscritTitle.text = data.sanskrit_name
        
        poseCell.poseImage.image = UIImage(named: "lotus")
        
        return poseCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}