//
//  SignInViewController.swift
//  Clitch
//
//  Created by Said Bachtarysev on 20/03/2018.
//  Copyright © 2018 Clitch. All rights reserved.
//

import UIKit
import IBAnimatable

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var signInButton: AnimatableButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstColor = UIColor(displayP3Red: 214.0/255.0, green: 21.0/255.0, blue: 70.0/255.0, alpha: 1.0).cgColor
        let secondColor = UIColor(displayP3Red: 255.0/255.0, green: 46.0/255.0, blue: 99.0/255.0, alpha: 1.0).cgColor
        

        let gradientColors = [firstColor, secondColor]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        
        //Set startPoint and endPoint
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = signInButton.bounds
        
        signInButton.layer.insertSublayer(gradientLayer, at: 0)
       
    }
    
    @IBAction func signInAction(_ sender: Any) {
        signInButton.animate(AnimationType.shake(repeatCount: 1), duration: 0.2, damping: 0.8, velocity: 1.0, force: 0.8)
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
