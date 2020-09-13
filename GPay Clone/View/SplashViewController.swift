//
//  SplashViewController.swift
//  GPay Clone
//
//  Created by Jovial on 9/13/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let gPin = UserDefaults.standard.bool(forKey: "isNewUser")
            
            if gPin == false{
                self.navigateToSetGPinScreen()
            }else{
                self.navigateToGPinScreen()
            }
        }
    }
    
    func navigateToGPinScreen(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let PinVC = mainStoryboard.instantiateViewController(withIdentifier: "GPinViewController") as! GPinViewController
        PinVC.modalPresentationStyle = .fullScreen
        present(PinVC, animated: true, completion: nil)
    }
    
    func navigateToSetGPinScreen(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setPinVC = mainStoryboard.instantiateViewController(withIdentifier: "GPinSetupViewController") as! GPinSetupViewController
        setPinVC.modalPresentationStyle = .fullScreen
        present(setPinVC, animated: true, completion: nil)
    }

}
