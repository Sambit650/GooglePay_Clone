//
//  GPinViewController.swift
//  GPay Clone
//
//  Created by Jovial on 9/12/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class GPinViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstCheckbox: UIImageView!
    @IBOutlet weak var secondCheckbox: UIImageView!
    @IBOutlet weak var thirdCheckbox: UIImageView!
    @IBOutlet weak var fourthCheckbox:UIImageView!
    @IBOutlet weak var forgotButton: UIButton!
    
    var userGPin = ""
    var enteredPin = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI(){
        resultLabel.isHidden = true
        forgotButton.isHidden = true
        userGPin = UserDefaults.standard.string(forKey: "userGPin")!
    }
    
    @IBAction func pinButtonPressed(_ sender: UIButton) {
        if enteredPin.count <= 3{
            resultLabel.isHidden = true
            enteredPin = enteredPin + String(sender.tag)
            print(enteredPin)
            
          if enteredPin == userGPin{
              print("sucess")
            
            //navigate to HomeScreen
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let HomeVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            HomeVC.modalPresentationStyle = .fullScreen
            present(HomeVC, animated: true, completion: nil)
            
          }else if enteredPin.count == 4 && enteredPin != userGPin{
             resultLabel.isHidden = false
             resultLabel.text = "incorrect pin,Try again."
             enteredPin = ""
          }
          checkBox()
            
        }else{
            print("limit exceed")
            enteredPin = ""
        }
        
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        if enteredPin.count != 0{
            //remove pin
            enteredPin.remove(at: enteredPin.index(before: enteredPin.endIndex))
            checkBox()
            print(enteredPin)
        }
    }
    func checkBox(){
        //for checkbox image
        switch enteredPin.count {
        case 0:
            firstCheckbox.image = UIImage(systemName: "circle")
            secondCheckbox.image = UIImage(systemName: "circle")
            thirdCheckbox.image = UIImage(systemName: "circle")
            fourthCheckbox.image = UIImage(systemName: "circle")
        case 1:
            firstCheckbox.image = UIImage(systemName: "circle.fill")
            secondCheckbox.image = UIImage(systemName: "circle")
            thirdCheckbox.image = UIImage(systemName: "circle")
            fourthCheckbox.image = UIImage(systemName: "circle")
        case 2:
            firstCheckbox.image = UIImage(systemName: "circle.fill")
            secondCheckbox.image = UIImage(systemName: "circle.fill")
            thirdCheckbox.image = UIImage(systemName: "circle")
            fourthCheckbox.image = UIImage(systemName: "circle")
        case 3:
            firstCheckbox.image = UIImage(systemName: "circle.fill")
            secondCheckbox.image = UIImage(systemName: "circle.fill")
            thirdCheckbox.image = UIImage(systemName: "circle.fill")
            fourthCheckbox.image = UIImage(systemName: "circle")
        case 4:
            firstCheckbox.image = UIImage(systemName: "circle.fill")
            secondCheckbox.image = UIImage(systemName: "circle.fill")
            thirdCheckbox.image = UIImage(systemName: "circle.fill")
            fourthCheckbox.image = UIImage(systemName: "circle.fill")
        default:
            print(" ")
        }
    }
    @IBAction func exitButtonPressed(_ sender: Any) {
        exit(0);
    }
    @IBAction func threeDotButtonPressed(_ sender: Any) {
        forgotButton.isHidden = !forgotButton.isHidden
    }
    
    @IBAction func forgotPinButtonPressed(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setPinVC = mainStoryboard.instantiateViewController(withIdentifier: "GPinSetupViewController") as! GPinSetupViewController
        setPinVC.modalPresentationStyle = .fullScreen
        present(setPinVC, animated: true, completion: nil)
    }
}
