//
//  OneOnOne.swift
//  Polytone
//
//  Created by Alejandrina Gonzalez on 10/31/16.
//  Copyright © 2016 Alejandrina Gonzalez Reyes. All rights reserved.
//

import UIKit
import Speech

class OneOnOne: UIViewController {

    @IBOutlet var close : UIButton!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    func closeView(){
        self.dismiss(animated: true, completion: nil)
        // performSegue(withIdentifier: "main", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        close.addTarget(self, action: #selector(LiveCaptioning.closeView), for: UIControlEvents.touchUpInside)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
