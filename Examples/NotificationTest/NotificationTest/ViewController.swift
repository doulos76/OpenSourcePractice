//
//  ViewController.swift
//  NotificationTest
//
//  Created by minhoi_goo on 05/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit

enum TempType {
  case up
  case down
}

class ViewController: UIViewController {
  
  @IBOutlet weak var receivedLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    setNotification()
  }
  
  func setNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(expressData(_:)), name: Notification.Name("receivedData"), object: nil)
  }
  
  @objc func expressData(_ notification: Notification) {
    if let data = notification.userInfo as? [String: TempType] {
      if let type = data["data"] {
        switch type {
        case .up:
          receivedLabel.text = "Up"
        case .down:
          receivedLabel.text = "Down"
        }
      }
    }
  }


}

