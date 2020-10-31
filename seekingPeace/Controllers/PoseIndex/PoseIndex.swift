//
//  PoseIndex.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class PoseIndex: UIViewController {

    
    var poseIndex = [YogaPoses]() {
        didSet {
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
    }
    

    

}

extension PoseIndex: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
