//
//  MainTabBarVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 10/30/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class MainTabBarVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstvc = YogaController()
        let secondvc = YogaFlowController()
        let thirdvc  = PoseIndexController()
       
        firstvc.tabBarItem = UITabBarItem(title: "Yoga", image: UIImage(systemName: "1.circle"), tag: 0)
        secondvc.tabBarItem = UITabBarItem(title: "Current Appointment", image: UIImage(systemName: "1.circle"), tag: 1)
        thirdvc.tabBarItem = UITabBarItem(title: "Poses", image: UIImage(systemName: "1.circle"), tag: 2)
        let tabVC = UITabBarController()

        tabVC.setViewControllers([firstvc,secondvc,thirdvc], animated: false)
       

    }
    

    

}
