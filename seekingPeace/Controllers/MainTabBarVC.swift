//
//  MainTabBarVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/30/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {


    let firstvc = SequenceVC()
    let secondvc = GlossaryVC()
    let thirdvc = SettingsVC()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstvc.tabBarItem = UITabBarItem(title: "Sequences", image: UIImage(systemName: "doc.plaintext"), tag: 0)
        secondvc.tabBarItem = UITabBarItem(title: "Glossary", image: UIImage(systemName: "text.book.closed.fill"), tag: 1)
        thirdvc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        
        self.viewControllers = [firstvc, secondvc, thirdvc]
        self.viewControllers?.forEach({$0.tabBarController?.tabBar.barStyle = .default})
    }

    

}
