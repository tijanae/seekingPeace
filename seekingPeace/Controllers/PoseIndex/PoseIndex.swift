//
//  PoseIndex.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class PoseIndex: UIViewController {

//    MARK: DATA
    var poseIndex = [YogaPoses]()
    
    
    
//    MARK: UIOBJECT
    // will later be removed after refactor- moving to PoseIndexObjects
    
    lazy var poseTableView: UITableView = {
       let poseIndex = UITableView()
        poseIndex.backgroundColor = .lightGray
        poseIndex.register(PoseIndexTVC.self, forCellReuseIdentifier: "poseData")
        return poseIndex
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        loadData()
        poseTableView.delegate = self
        poseTableView.dataSource = self
        addViews()
        addConstraints()
        
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
    
    private func addViews() {
        view.addSubview(poseTableView)
    }
    
    private func addConstraints() {
        poseTableViewConstraint()
    }
    
    private func poseTableViewConstraint() {
        poseTableView.translatesAutoresizingMaskIntoConstraints = false
        
        [poseTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         poseTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         poseTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         poseTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)].forEach{$0.isActive = true}
    }
    

    

}

extension PoseIndex: UITableViewDelegate, UITableViewDataSource {
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
