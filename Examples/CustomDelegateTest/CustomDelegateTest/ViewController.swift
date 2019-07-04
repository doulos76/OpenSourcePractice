//
//  ViewController.swift
//  CustomDelegateTest
//
//  Created by minhoi_goo on 04/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit

//: # Delegate 구현부

// MARK:- class

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let customView = CustomView()
    
    //: (3) custom instance의 delegate 프로퍼티에 자기 자신의 인스턴스를 할당(프로토콜 추상화 타입)
    //: - ViewController입장에선, 내가 구현한 메서드를 실행하진 않지만, customView가 적절한 곳에서 호출했을 것이다.
    //: customView가 특정 위치에서 해당 메서드를 호출한 것을 예상하여 필요한 행동을 구현한다.
    customView.delegate = self
  }
}

//: (1) CustomView Delegate 채택
extension ViewController: CustomViewDelegate {
  
  //: (2) 채택한 Delegate method 구현
  func viewFrameChanged(newFrame: CGRect) {
    print("\n-----------[viewFramChanged \(newFrame)]-----------\n")
  }
}
