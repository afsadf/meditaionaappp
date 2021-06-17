//
//  SingInViewController.swift
//  IOSKartenicheva
//
//  Created by user on 15.06.2021.
//

import UIKit
import SwiftyJSON
import Alamofire

class SingInViewController: UIViewController {

    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPass: UITextField!
    @IBOutlet weak var btnSingUp: UIButton!
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Уведомление", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnAutoAction(_ sender: Any) {
        guard inputEmail.text?.isEmpty == false && inputPass.text?.isEmpty == false   else {return showAlert(message: "Поля пустые")}
            
            let url = "http://cinema.areas.su/auth/login?email=\(inputEmail.text!)&password=\(inputPass.text!)"
            print (url)
            
            AF.request(url, method: .post).validate().responseJSON {response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let token: Int?
                    print(json)
                    token = json["notice"]["token"].intValue
//                    if token! > 0 {
                        print(token)
                        self.performSegue(withIdentifier: "goMain", sender: nil)
//                    } else {
//                        self.showAlert(message: String(token!))
//
//                    }
                case .failure(let error):
                    self.showAlert(message: error.localizedDescription)
                }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        inputEmail.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        inputEmail.layer.borderWidth = 1
        
        inputPass.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        inputPass.layer.borderWidth = 1
        
        btnSingUp.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        btnSingUp.layer.borderWidth = 1
    }
}
