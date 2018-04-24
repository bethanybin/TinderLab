//
//  ViewController.swift
//  TinderLab
//
//  Created by Bethany Bin on 4/24/18.
//  Copyright © 2018 Bethany Bin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    var cardInitialCenter: CGPoint! 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileViewSegue" {
            let ProfileViewController = segue.destination as! ProfileViewController
            ProfileViewController.image = userImageView.image
            
        }
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let transform = CGFloat(30 * Double.pi / 180)
        if sender.state == .began {
            //
        } else if sender.state == .changed {
            let location = sender.location(in: userImageView)
            if location.y <= userImageView.center.y {
                if translation.x > 0 {
                    userImageView.transform = CGAffineTransform(rotationAngle: transform)
                } else {
                    userImageView.transform = CGAffineTransform(rotationAngle: -transform)
                }
            } else {
                if translation.x > 0 {
                    userImageView.transform = CGAffineTransform(rotationAngle: -transform)
                } else {
                    userImageView.transform = CGAffineTransform(rotationAngle: transform)
                }
            }
        } else {
            if translation.x > 50 {
                UIView.animate(withDuration: 0.8) {
                    self.userImageView.center.x = 2*self.view.frame.width
                }
            } else if translation.x < -50 {
                UIView.animate(withDuration: 0.8) {
                    self.userImageView.center.x = -self.view.frame.width
                }
            } else {
                UIView.animate(withDuration: 0.8) {
                    self.userImageView.transform = CGAffineTransform.identity
                }
            }
        }
    }
    
}

