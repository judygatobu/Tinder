//
//  ProfileeeViewController.swift
//  Tinder
//
//  Created by Judy Gatobu on 5/3/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit

class ProfileeeViewController: UIViewController {

    
    @IBOutlet weak var cardImage: UIImageView!
    
   
    var profileCardImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let card = profileCardImage{
            cardImage.image = card
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
}
