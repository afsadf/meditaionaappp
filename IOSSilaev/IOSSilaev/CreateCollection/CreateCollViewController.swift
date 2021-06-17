//
//  CreateCollViewController.swift
//  IOSKartenicheva
//
//  Created by user on 16.06.2021.
//

import UIKit

class CreateCollViewController: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var btnIcon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputName.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        inputName.layer.borderWidth = 1
        
        btnIcon.layer.borderColor = #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        btnIcon.layer.borderWidth = 1
    }
    

}
