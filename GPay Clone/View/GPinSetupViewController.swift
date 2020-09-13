//
//  GPinSetupViewController.swift
//  GPay Clone
//
//  Created by Jovial on 9/13/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class GPinSetupViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var firstTextfield: UITextField!
    @IBOutlet weak var secondTextfield: UITextField!
    @IBOutlet weak var thirdTextfield: UITextField!
    @IBOutlet weak var fourthTextfield: UITextField!
    @IBOutlet weak var cFirstTextfield: UITextField!
    @IBOutlet weak var cSecondTextfield: UITextField!
    @IBOutlet weak var cThirdTextfield: UITextField!
    @IBOutlet weak var cFourthTextfield: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI(){
        continueButton.layer.cornerRadius = 20
        firstTextfield.delegate = self
        secondTextfield.delegate = self
        thirdTextfield.delegate = self
        fourthTextfield.delegate = self
        cFirstTextfield.delegate = self
        cSecondTextfield.delegate = self
        cThirdTextfield.delegate = self
        cFourthTextfield.delegate = self
    }
    
    @IBAction func firstEyeButtonPressed(_ sender: Any) {
        firstTextfield.isSecureTextEntry = !firstTextfield.isSecureTextEntry
        secondTextfield.isSecureTextEntry = !secondTextfield.isSecureTextEntry
        thirdTextfield.isSecureTextEntry = !thirdTextfield.isSecureTextEntry
        fourthTextfield.isSecureTextEntry = !fourthTextfield.isSecureTextEntry
    }
    @IBAction func secondEyeButtonPressed(_ sender: Any) {
        cFirstTextfield.isSecureTextEntry = !cFirstTextfield.isSecureTextEntry
        cSecondTextfield.isSecureTextEntry = !cSecondTextfield.isSecureTextEntry
        cThirdTextfield.isSecureTextEntry = !cThirdTextfield.isSecureTextEntry
        cFourthTextfield.isSecureTextEntry = !cFourthTextfield.isSecureTextEntry
    }
    @IBAction func continueButtonPressed(_ sender: Any) {
        if !firstTextfield.text!.isEmpty && !secondTextfield.text!.isEmpty && !thirdTextfield.text!.isEmpty && !fourthTextfield.text!.isEmpty && !cFirstTextfield.text!.isEmpty && !cSecondTextfield.text!.isEmpty && !cThirdTextfield.text!.isEmpty && !cFourthTextfield.text!.isEmpty{
            let userPin = firstTextfield.text! + secondTextfield.text! + thirdTextfield.text! + fourthTextfield.text!
            let confirmPin = cFirstTextfield.text! + cSecondTextfield.text! + cThirdTextfield.text! + cFourthTextfield.text!
            if userPin == confirmPin{
                
                print("success")
                UserDefaults.standard.set(confirmPin, forKey: "userGPin")
                UserDefaults.standard.set(true, forKey: "isNewUser")
                
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let PinVC = mainStoryboard.instantiateViewController(withIdentifier: "GPinViewController") as! GPinViewController
                PinVC.modalPresentationStyle = .fullScreen
                present(PinVC, animated: true, completion: nil)
                
            }else{
                print("invalid confirm pin")
            }
            
        }else{
            print("fail")
        }
    }
    
    func textFieldShouldReturnSingle(_ textField: UITextField , newString : String)
    {
        let nextTag: Int = textField.tag + 1
        
        let nextResponder: UIResponder? = textField.superview?.superview?.viewWithTag(nextTag)
        textField.text = newString
        if let nextR = nextResponder
        {
            nextR.becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = ((textField.text)! as NSString).replacingCharacters(in: range, with: string)
        
        let newLength = newString.count
        
        if newLength == 1 {
            textFieldShouldReturnSingle(textField , newString : newString)
            return false
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }

}
