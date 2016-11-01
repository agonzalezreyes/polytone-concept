//
//  ViewController.swift
//  Polytone
//
//  Created by Alejandrina Gonzalez on 10/28/16.
//  Copyright © 2016 Alejandrina Gonzalez Reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate {
    
    var gradient = CAGradientLayer()
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images = ["oc.png","convo.png","files.png","settings.png"]
    let titles = ["Live Captioning","1-on-1","Saved","Settings"]
    let colors = [UIColor.Color.color5,UIColor.Color.color1,UIColor.Color.color2,UIColor.Color.color3,UIColor.Color.color4]

    let transition = BubbleTransition()
    
    var center = CGPoint()
    var transitionColor = UIColor()
    
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
        button.setImage(UIImage(named: "i.png"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: #selector(ViewController.info), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        button.tintColor = UIColor.white
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
        
        // custom nav bar controller 
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"h.png"), for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
             NSFontAttributeName: UIFont.systemFont(ofSize: 19)]
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
        
       var cell = AGCollectionViewCell()
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath as IndexPath) as! AGCollectionViewCell
        
        switch indexPath.row {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! AGCollectionViewCell
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! AGCollectionViewCell
        case 2:
            cell.pinImage.image = UIImage(named: images[indexPath.row])

            cell.title.font = UIFont(name: "Menlo", size: 30)
        case 3:
            cell.pinImage.image = UIImage(named: images[indexPath.row])

            cell.title.font = UIFont(name: "Menlo", size: 30)
        default:
            cell.backgroundColor = UIColor.Color.color1.withAlphaComponent(0.9)
        }
        cell.backgroundColor = colors[indexPath.row].withAlphaComponent(0.9)
        cell.title.adjustsFontSizeToFitWidth = true
        cell.title.text = titles[indexPath.row]
        //cell.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = self.view.bounds.size.width
        let h = self.view.bounds.size.height
        if (indexPath.row == 0 || indexPath.row == 1){
            return CGSize(width: (w-30)/2, height: (h-80)/2)
        }
        return CGSize(width: w-20, height: (h-90)/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rect = collectionView.layoutAttributesForItem(at: indexPath)?.frame
        let point = CGPoint(x: rect!.midX, y: rect!.midY)
        center = collectionView.convert(point, to: nil)
        
        transitionColor = colors[indexPath.row]
        
        switch indexPath.row {
        case 0:
        
            performSegue(withIdentifier: "livecaptioning", sender: self)
        case 1:
            performSegue(withIdentifier: "oneonone", sender: self)
        case 2:
            performSegue(withIdentifier: "saved", sender: self)
        case 3:
            performSegue(withIdentifier: "settings", sender: self)
        default:
            performSegue(withIdentifier: "livecaptioning", sender: self)
        }
    }

    func info() {
        print("info")
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "heart.png")
        alertView.showInfo("Polytone", subTitle: "A Team", circleIconImage: alertViewIcon)
    }

    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
        controller.view.backgroundColor = transitionColor
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        transition.startingPoint = center
        transition.bubbleColor = transitionColor
        return transition
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint =  center
        transition.bubbleColor = transitionColor
        return transition
    }

}



