//
//  User.swift
//  RxMVVM+Texture
//
//  Created by minhoi_goo on 08/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import Foundation

class User: Decodable {
  var username: String = ""
  var profileURL: URL?
  
  enum CodingKeys: String, CodingKey {
    case username = "login"
    case profileURL = "avatar_url"
  }
  
  func merge(_ user: User?) {
    guard let user = user else { return }
    self.username = user.username
    self.profileURL = user.profileURL
  }
}
