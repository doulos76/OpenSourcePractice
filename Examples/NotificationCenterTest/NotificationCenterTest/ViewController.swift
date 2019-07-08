//
//  ViewController.swift
//  NotificationCenterTest
//
//  Created by minhoi_goo on 05/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit

// MARK:- Enum
//enum TempType {
//  case id
//  case password
//}

struct PersonalData {
  var id: String
  var name: String
}

class ViewController: UIViewController {
  
  // MARK:- IBOutlet
  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var passwordLabel: UILabel!

  // MARK:- View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK:- Methods
  func setNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(displayPersonalData(_:)), name: Notification.Name("recievedData"), object: nil)
  }
  
  @objc func displayPersonalData(_ notification: Notification) {
    guard let data = notification.userInfo as? [String: TempType] else { return }
    guard let personData = data["data"] else { return }
    switch personData {
    case .id:
      idLabel.text = "ID"
    case .password:
      passwordLabel.text = "PASSWORD"
      
    }
  }
}

