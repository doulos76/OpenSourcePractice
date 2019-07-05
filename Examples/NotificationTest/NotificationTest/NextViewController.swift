//
//  NextViewController.swift
//  NotificationTest
//
//  Created by minhoi_goo on 05/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
  
  // MARK:- IBOutlet
  
  @IBOutlet weak var dataTextField: UITextField!
  
  // MARK:- View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK:- IBActions
  
  @IBAction func backToPreviousViewController(_ sender: UIButton) {
    self.presentingViewController?.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func transferDataToNotificationCenter(_ sender: UIButton) {
    var userInfo: [String: TempType] = [:]
    if dataTextField.text == "Up" {
      userInfo.updateValue(.up, forKey: "data")
    } else {
      userInfo.updateValue(.down, forKey: "data")
    }
    NotificationCenter.default.post(name: NSNotification.Name("receivedData"), object: nil, userInfo: userInfo)
    dismiss(animated: true)
  }
}
