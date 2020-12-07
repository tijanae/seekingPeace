//
//  createSequenceVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 12/6/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class createSequenceVC: UIViewController {
    
//    MARK: DATA
    
    var poses: [YogaPose]!
//    var poseIds: [Int]!
    var sequenceDetailView = createSequenceDetail()
    
    override func loadView() {
        view = sequenceDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        loadData()
        print(poses)
        
//        sequenceDetailView.playlistTV.dataSource = self
//        sequenceDetailView.playlistTV.delegate = self

        // Do any additional setup after loading the view.
    }
    

    private func loadData() {
        sequenceDetailView.playlistImage.image = UIImage(named: "plant")
//        sequenceDetailView.playlistTV
        
        
    }

}

//extension createSequenceVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(poseIds.count)
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let data =
//        return
//    }
//    
//    
//}
