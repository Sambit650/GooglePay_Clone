//
//  HomeViewController.swift
//  GPay Clone
//
//  Created by Jovial on 9/12/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    @IBOutlet weak var newPaymentButton: UIButton!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var scannerButton: UIButton!
    @IBOutlet weak var userProfileButton: UIButton!
    @IBOutlet weak var peopleCollectionView: UICollectionView!
    @IBOutlet weak var businessCollectionView: UICollectionView!
    @IBOutlet weak var businessExploreBurron: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI(){
        childView.layer.cornerRadius = 40
        userProfileButton.layer.cornerRadius = 20
        newPaymentButton.layer.cornerRadius = 20
        businessExploreBurron.layer.cornerRadius = 20
        
        peopleCollectionView.delegate = self
        peopleCollectionView.dataSource = self
        businessCollectionView.delegate = self
        businessCollectionView.dataSource = self
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.peopleCollectionView{
           return 5
        }else{
            return 6
        }
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.peopleCollectionView{
        let peopleCell = peopleCollectionView.dequeueReusableCell(withReuseIdentifier: "PeopleCollectionViewCell", for: indexPath) as! PeopleCollectionViewCell
        return peopleCell
        }else{
            let businessCell = businessCollectionView.dequeueReusableCell(withReuseIdentifier: "BusinessCollectionViewCell", for: indexPath) as! BusinessCollectionViewCell
            return businessCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: peopleCollectionView.bounds.width / 4 - 20 , height: 100)
    }
}
