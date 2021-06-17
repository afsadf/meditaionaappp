//
//  ProfileViewController.swift
//  IOSKartenicheva
//
//  Created by user on 15.06.2021.
//

import UIKit
import SwiftyJSON
import Alamofire

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    
    @IBOutlet weak var btnExit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnExit.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        btnExit.layer.borderWidth = 1
//        let token = UserDefaults.standard.string(forKey: "token")!
//        let url = "http://cinema.areas.su/user"
//        let heardes: HTTPHeaders = ["Authorization": "Bearer\(token)"]
//        AF.request(url, method: .get, headers: heardes).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//            let json = JSON(value)
//            print("JSON: \(json)")
//            let imgSourse = json[0]["avatar"].stringValue
//            let nameSourse = json["firstName"].stringValue
//            let name2Sourse = json["lastName"].stringValue
//            let url2 = "http://cinema.areas.su/up/images\(imgSourse)"
//            let url3 = "http://cinema.areas.su/up/user\(nameSourse)"
//            if let data = try? Data(contentsOf: URL(string: url2)!){
//                self.imgAvatar.image = UIImage(data: data)
//
//            }
//
//            case .failure(let error):
//            print(error)
//            }
//        }
        
    }
    
}
