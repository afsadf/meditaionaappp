//
//  ChatViewController.swift
//  IOSKartenicheva
//
//  Created by user on 15.06.2021.
//

import UIKit
import SwiftyJSON
import Alamofire

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let token = UserDefaults.standard.string(forKey: "token")!
//        let heardes: HTTPHeaders = ["Authorization": "Bearer\(token)"]
//        
//        let url3 = "http://cinema.areas.su//chats/1/messages"
//
//        AF.request(url3, method: .get, headers: heardes).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//            let json = JSON(value)
//            print("JSON: \(json)")
//                let mes.text = " \(json[0]["firstName"].stringValue) \(json[0]["lastName"].stringValue) \(json[0]["creationDateTime."].stringValue)"
//            let imgSourse2 = json[0]["avatar"].stringValue
//            let urlI = "http://cinema.areas.su/up/images\(imgSourse2)"
//            if let data = try? Data(contentsOf: URL(string: urlI)!){
//                self.chatAvatar.image = UIImage(data: data)
//            }
//            case .failure(let error):
//            print(error)
//            }
//        }
    }
    


}
