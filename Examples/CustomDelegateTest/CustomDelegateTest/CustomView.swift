//
//  CustomView.swift
//  CustomDelegateTest
//
//  Created by minhoi_goo on 04/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit
//: # Delegate 선언부

// MARK:- Protocol
//: (1) Protocol 생성
protocol CustomViewDelegate {
  func viewFrameChanged(newFrame: CGRect)
}

// MARK:- View class

class CustomView: UIView {
  
  //: (2) class에 delegate property 생성
  //: - 일반적으로 delegate란 이름 사용
  //: - 타입은 프로토콜 추상화 타입
  var delegate: CustomViewDelegate?
  
  override func layoutSubviews() {
    //: (3) delegate 인스턴스의 메서드 실행
    //: - 현재 customView 입장에선 delegate instance가 존재하는지 모름
    //: - 하지만 만약 어떤 instance(A)가 나의 delegate instance 값을 할당했다면, 분명 A는 나의 프로토콜을 채택했으며 (타입이 같기 때문에) 메서드를 구현 했다는 것을 인지!
    //: - delegate method를 사용해서 메서드 실행 및 리턴값을 받아와 사용
    delegate?.viewFrameChanged(newFrame: self.frame)
  }
}
