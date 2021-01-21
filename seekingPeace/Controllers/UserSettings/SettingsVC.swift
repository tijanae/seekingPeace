//
//  SettingsVC.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/4/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    private let settingsView = SettingsView()
    
    private let settingsNames = ["display", "yoga"]
    

    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        settingsView.settingsTableView.dataSource = self
        settingsView.settingsTableView.delegate = self
        objectTargets()
        // Do any additional setup after loading the view.
    }
    
//    MARK: Private Funcs
    
    private func objectTargets() {
        settingsView.logoutButton.addTarget(self, action: #selector(logoutUser), for: .touchUpInside)
    }
    
//    MARK: Objective C Funcs
    
    @objc func logoutUser() {
        FirebaseAuthService.manager.signOut()
        let logOut = LoginVC()
        logOut.modalPresentationStyle = .fullScreen
        present(logOut, animated: true, completion: nil)
    }

    

}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "settings", for: indexPath) as? MainSettingsTVC else{fatalError("Couldnt Dequeue MainSettingsTVC")}
        cell.settingsLabel.text = settingsNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hi")
    }
    
}


