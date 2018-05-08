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
    
    var cardImageHolder: UIImage!
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     cardImage.image = cardImageHolder

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let dest = segue.destination as? CardViewController {
            dest.modalPresentationStyle = UIModalPresentationStyle.custom
            fadeTransition = FadeTransition()
            dest.transitioningDelegate = fadeTransition
            fadeTransition.duration = 1.0
        }
    }
    
    @IBAction func didTapHome(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ProfileSegue", sender: nil)
    }
}

    
    

