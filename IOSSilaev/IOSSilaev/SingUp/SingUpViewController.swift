//
//  SingUpViewController.swift
//  IOSKartenicheva
//
//  Created by user on 15.06.2021.
//

import UIKit
import SwiftyJSON
import Alamofire

class SingUpViewController: UIViewController {

    @IBOutlet weak var inputName1: UITextField!
    @IBOutlet weak var inputLastName1: UITextField!
    @IBOutlet weak var inputEmail1: UITextField!
    @IBOutlet weak var inputPass1: UITextField!
    @IBOutlet weak var inputRPass1: UITextField!
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputName1.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        inputName1.layer.borderWidth = 1
        
        inputLastName1.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        inputLastName1.layer.borderWidth = 1
        
        inputEmail1.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        inputEmail1.layer.borderWidth = 1
        
        inputPass1.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        inputPass1.layer.borderWidth = 1
        
        inputRPass1.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        inputRPass1.layer.borderWidth = 1
        
        btnBack.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        btnBack.layer.borderWidth = 1
    
    }
    
    func checkValidatePassword() -> Bool {
        if inputPass1.text == inputRPass1.text {
            print("Проверка пароля")
            return true
        } else {
            return false
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Уведомление", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
     //Проверка полей
    @IBAction func RegAction(_ sender: Any) {
        guard inputPass1.text?.isEmpty == false && inputPass1.text?.isEmpty == false && inputEmail1.text?.isEmpty == false && inputName1.text?.isEmpty == false && inputLastName1.text?.isEmpty == false
        else {return showAlert(message: "Поля пустые")}
        
        guard isValidEmail(emailID: inputEmail1.text!)else {return showAlert(message: "Проверте правильность почты")}
        guard inputPass1.text?.isEmpty == false else {return print("Empty!")}
        guard checkValidatePassword() else {return showAlert(message: "Пароли не совпадают")}

            let url = "http://cinema.areas.su/auth/register?email=\(inputEmail1.text!)&password=\(inputPass1.text!)&firstName=\(inputName1.text!)&lastName=\(inputLastName1.text!)"
            print (url)
            
            AF.request(url, method: .post).validate().responseString{response in
                switch response.result {
                case .success(let value):
//                    let json = JSON(value)
//                    let token: Int?
                    print(value)
//                    token = json["notice"]["token"].intValue
//                    if token! > 0 {
//                        print(token)
//                    } else {
//                        self.showAlert(message: String(token!))
                        self.performSegue(withIdentifier: "goMain", sender: nil)
//                    }
                case .failure(let error):
                    self.showAlert(message: error.localizedDescription)
                }
             }
             print("OK")
        }

    func isValidEmail(emailID: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }


    


}
