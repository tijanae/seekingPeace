//
//  MainTabBarVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/30/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {

    
//    let firstvc = YogaController()
    let firstvc = CreateVC()
    let secondvc = SequenceVC()
    let thirdvc = IndexVC()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createMainTabBarController()
        view.backgroundColor = .green
        firstvc.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "flowchart"), tag: 0)
        secondvc.tabBarItem = UITabBarItem(title: "Sequences", image: UIImage(systemName: "doc.plaintext"), tag: 1)
        thirdvc.tabBarItem = UITabBarItem(title: "Index", image: UIImage(systemName: "doc.plaintext"), tag: 2)
        
        self.viewControllers = [firstvc, secondvc, thirdvc]
        self.viewControllers?.forEach({$0.tabBarController?.tabBar.barStyle = .default})
    }

    

}
