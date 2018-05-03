//
//  CardViewController.swift
//  Tinder
//
//  Created by Judy Gatobu on 5/2/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    var initialCardPos: CGPoint?
    
    var newCard: UIImageView?
    
    var rotation:CGFloat = 0
    
    @IBOutlet weak var CardView: UIImageView!
    var cardviewimage: UIImage?
   
    
    func panCard(sender: UIPanGestureRecognizer) {
        
        var Card = sender.view as! UIImageView
        
        let bounds = UIScreen.main.bounds
        let screenWidth = bounds.width
        
        var translate = sender.translation(in: view)
        
        print("translate x \(translate.x)")
        
        switch sender.state{
            
        case .began:
            newCard = UIImageView(frame: Card.frame)
            newCard!.image = Card.image
           
            
            
            initialCardPos = Card.center
            view.addSubview(newCard!)
            newCard!.center = initialCardPos!
            newCard!.image! = newCard!.image!.stretchableImage(withLeftCapWidth: CardView.image!.leftCapWidth, topCapHeight: CardView.image!.topCapHeight)
            
        case .changed:
            rotation = rotation + 0.1
            newCard!.center = CGPoint(x: initialCardPos!.x + translate.x, y: initialCardPos!.y + translate.y - 0.1)
            newCard!.transform = CGAffineTransform(rotationAngle: rotation)
            
        case .ended:
            if (translate.x > 50)
            {
                let offscreen = screenWidth - self.newCard!.center.x
                
                UIView.animate(withDuration: 1) {
                    self.newCard!.center = CGPoint(x: offscreen, y: self.newCard!.center.y)
                    
                }
                
                newCard!.removeFromSuperview()
                
            }
            else if (translate.x < -50){
                UIView.animate(withDuration: 0.5) {
                    self.newCard!.center = CGPoint(x: self.newCard!.center.x - screenWidth, y: self.newCard!.center.y)
                    
                }
                
                newCard!.removeFromSuperview()
            }
            else {
                UIView.animate(withDuration: 0.4) {
                    self.newCard?.transform = CGAffineTransform.identity
                    self.newCard?.center = CGPoint(x: self.initialCardPos!.x, y: self.initialCardPos!.y)
                }
                
                newCard!.removeFromSuperview()
            }
            
            
        default:
            return
        }
    }
    
    func touchCard(sender: UITapGestureRecognizer){
        print("cardview image \(String(describing: CardView.image))")
        performSegue(withIdentifier: "Info", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! ProfileeeViewController
        if let card = cardviewimage{
            
            print("cardview image \(card)")
            detail.profileCardImage = card
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCard(sender:)))
        CardView.addGestureRecognizer(panGesture)
        CardView.isUserInteractionEnabled = true
        let g = UITapGestureRecognizer(target: self, action: #selector(touchCard(sender:)))
        CardView.addGestureRecognizer(g)
        cardviewimage = CardView.image
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
