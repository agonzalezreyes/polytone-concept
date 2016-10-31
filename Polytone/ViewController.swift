//
//  ViewController.swift
//  Polytone
//
//  Created by Alejandrina Gonzalez on 10/28/16.
//  Copyright © 2016 Alejandrina Gonzalez Reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var gradient = CAGradientLayer()
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images = ["oc.png","convo.png","files.png","settings.png"]

    func createGradientLayer() {
        gradient = CAGradientLayer()
        
        gradient.frame = self.view.bounds
        let color1 = UIColor.Color.polytone.cgColor
        let color2 = UIColor.Color.HarmonicEnergy2.cgColor
        gradient.colors = [color2, color1]
        gradient.locations = [0.1,0.5,6]
        self.view.layer.addSublayer(gradient)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        createGradientLayer()
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
        //create a new button
        let button: UIButton = UIButton(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "info.png"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: #selector(ViewController.info), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
    
       
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! AGCollectionViewCell
        
        switch indexPath.row {
        case 0:
           cell.backgroundColor = UIColor.Color.color5.withAlphaComponent(0.9)
        case 1:
            cell.backgroundColor = UIColor.Color.color2.withAlphaComponent(0.9)
        case 2:
            cell.backgroundColor = UIColor.Color.color3.withAlphaComponent(0.9)
        case 3:
            cell.backgroundColor = UIColor.Color.color4.withAlphaComponent(0.9)
        default:
            cell.backgroundColor = UIColor.Color.color1.withAlphaComponent(0.9)

        }
        //cell.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        //cell.pinImage.image = UIImage(named: images[indexPath.row])
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = self.view.bounds.size.width
        let h = self.view.bounds.size.height
        if (indexPath.row == 0 || indexPath.row == 1){
            return CGSize(width: (w-30)/2, height: (h-90)/2)
        }
        return CGSize(width: w-20, height: (h-120)/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    



func info()
{
    print("info")
}



}

