//
//  ViewController.swift
//  TextFieldEmailAndPasswordLOgingbutton
//
//  Created by R87 on 22/12/22.
//

struct Student{
    var id: Int
    var name: String
    var branch: String
}


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cantainarView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dateOfBirthTxtField: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var genderPickerView: UIPickerView!
    
    
    var arrGenders: [String] = ["Male","Female","Other"]
    
    var arrStudent: [Student] = [Student(id: 1, name: "kaushik", branch: "Rnw1"),
                                 Student(id: 2, name: "rahul", branch: "Rnw2"),
                                 Student(id: 3, name: "parth", branch: "Rnw3"),
                                 Student(id: 4, name: "ankit", branch: "Rnw4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
      
        
    }

    
    
    
    private func setup(){
        setCornerRadius(view: cantainarView, radious: 10)
        [emailTextField, dateOfBirthTxtField,password,registerButton].forEach { setCornerRadius(view: $0, radious: 10) }
//        emailTextField.delegate = Self
//        dateOfBirthTxtField.delegate = self
        
        emailTextField.becomeFirstResponder()
//        password.isSecureTextEntry = true
//        print(emailTextField.tag)
//        print(passwordTextField.tag)
//        print(confirmPassword.tag)
        
    }
    
    @IBAction func ragistretionButtonTapped(_ sender: UIButton) {
        }
    func setCornerRadius(view: UIView , radious: CGFloat){
        view.layer.cornerRadius = radious
        view.layer.masksToBounds = true
    }
    override func touchesBegan(_ touches: Set<UITouch> ,with event:UIEvent?)
    {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}


extension ViewController: UITextViewDelegate{
    
    func textFielsShouldEditing(_ textField: UITextField)->Bool{
        
        switch textField.tag{
        case 0: return true
        case 1: return false
        case 2: return true
        default: return true
        }
//        switch textField.tag{
//        case 1: return false
//        default: return true
//        }
    }
    func textFieldDidEditing(_ textField: UITextField){
        print(textField.tag)
    }
    func textFieldEndEditing(_ textField: UITextField)-> Bool{
        return true
    }
    
    func textFieldEndEditing(_ textField: UITextField){
//        if textField.tag == 0{
//            passwordTextField.becomeFirstResponder()
//        }
        print(textField.text ?? "")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        view.endEditing(true)
        return true
    }
    
    func textField(_ textFiled: UITextField , shouldchangeCharactersIN range: NSRange, replacemantString string: String)-> Bool{
        
        if textFiled.tag == 0{
            if string == "@"{
                return false
            } else {
                return true
            }
        } else if textFiled.tag == 2 {
            if string.contains("/"){
                return false
            } else {
                return true
            }
        }
        
        return true
    }
    
}
