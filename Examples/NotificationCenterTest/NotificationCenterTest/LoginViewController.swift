//
//  LoginViewController.swift
//  NotificationCenterTest
//
//  Created by minhoi_goo on 05/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  // MARK:- IBOutlet
  @IBOutlet weak var idTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  // MAKR:- View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK:- IBActions
  @IBAction func loginButton(_ sender: UIButton) {
    var userInfo: [String: PersonalData] = [:]
    if idTextField.text == "idusername" && passwordTextField.text == "1234" {
      userInfo.updateValue(idTextField.text, forKey: "id")
      userInfo.updateValue(passwordTextField.text, forKey: "password")
    } else {
      userInfo.updateValue(.password, forKey: "data")
    }
    NotificationCenter.default.post(name: NSNotification.Name("recievedData"), object: nil, userInfo: userInfo)
    dismiss(animated: true)
  }
  
  @IBAction func closeButtonTapped(_ sender: UIButton) {
    dismiss(animated: true, completion: {
      print("close")
    })
  }
  
}
