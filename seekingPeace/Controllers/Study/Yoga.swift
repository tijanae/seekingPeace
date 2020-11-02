//
//  yoga.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/14/20.
//  Copyright © 2020 Tia Lendor. All rights reserved.
//

import UIKit

class Yoga: UIViewController {
    
// MARK: DATA
    
    var yogaInfo = [YogaPoses]()
    
// MARK: Objects
    lazy var yogaCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let yogacv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        yogacv.backgroundColor = .lightGray
        yogacv.register(yogaCell.self, forCellWithReuseIdentifier: "yogaCell")
        yogacv.dataSource = self
        yogacv.delegate = self
        
        return yogacv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        addViews()
        addConstraint()
        view.backgroundColor = .darkGray

        // Do any additional setup after loading the view.
    }
    
    
// MARK: Private Func
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "Yoga", ofType: "json")
            else {
                fatalError("Unexpected Error: cannot find JSON")
        }
        
        let url = URL(fileURLWithPath: pathToJSONFile)
        do{
            let data = try Data(contentsOf: url)
            self.yogaInfo = try YogaPoses.getYogaPoses(from: data)
        } catch {
            print(error)
            fatalError("Unexpected Error in yoga")
        }
    }
    
    
    
    private func addViews() {
        view.addSubview(yogaCollection)
    }
    
    private func addConstraint() {
        collectionViewConstraint()
    }
    
    private func collectionViewConstraint() {
        yogaCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yogaCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            yogaCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            yogaCollection.widthAnchor.constraint(equalTo: view.widthAnchor)])
    }

    

}

extension Yoga: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("yoga info count \(yogaInfo.count)")
        return yogaInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let yogaCell = collectionView.dequeueReusableCell(withReuseIdentifier: "yogaCell", for: indexPath) as? yogaCell else {return UICollectionViewCell()}
        let data = yogaInfo[indexPath.row]
        
        yogaCell.engName.text = data.english_name
        yogaCell.sanskritName.text = data.sanskrit_name
        
//        yogaCell.yogaImage.image = UIImage(named: "lotus")
        
        ImageHelper.shared.getImage(urlStr: "\(data.img_url)") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    yogaCell.yogaImage.image = UIImage(named: "lotus")
                    print(data.img_url)
                case .success(let yogaImg):
                    yogaCell.yogaImage.image = yogaImg
                }
            }
        }
        
        return yogaCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 300)
    }
    
    
}
