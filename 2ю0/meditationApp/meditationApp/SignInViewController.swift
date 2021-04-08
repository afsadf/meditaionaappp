//
//  ViewController.swift
//  meditationApp
//
//  Created by user on 01.04.2021.
//

import UIKit
import SwiftyJSON
import Alamofire

class SignInViewController: UIViewController {
    @IBOutlet weak var inputLogin: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
     
    let userDef = UserDefaults.standard
    
    @IBAction func signInAction( sender: UIButton){
        let url = "http://mskko2021.mad.hakta.pro/api/user/login"
        let param: [String: String] = [
        
            "email": inputLogin.text!,
            "password": inputPassword.text!,
        ]
        AF.request(url, method: .post, parameters: param, encoder: JSONParameterEncoder.default).validate().responseJSON { response in
        switch response.result {
        case .success(let value ):
            let json = JSON(value)
            let token = json["token"].stringValue
            self.userDef.setValue(token, forKey: "userToken")
            case .failure(let error ):
            let errorJSON = JSON(response.data)
            let errorDescription  = errorJSON["error"].stringValue
            self.showAlert(message: errorDescription)
            
        }
        }
       
        
    }

func showAlert(message: String){
    let alert = UIAlertController(title: "Уведомление", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
    present(alert, animated: true,completion: nil)
    func isValidEmail(emailID: String) ->Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za=z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
        
    }
    
}
    @IBAction func SignInAction( sender: UIButton){
        guard inputPassword.text?.isEmpty == false && inputPassword.text?.isEmpty == false else { return showAlert(message: "Поля пустые")}
        guard isValidEmail (emailID: inputLogin.text!) else { return showAlert(message: "Проверьте правильность почты")}
    }
    
    func isValidEmail(emailID: String) -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        inputLogin.text = "k31@ru.ru"
        inputPassword.text = "123"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func hideKeyBoard(){
        view.endEditing(true)
    }

}

