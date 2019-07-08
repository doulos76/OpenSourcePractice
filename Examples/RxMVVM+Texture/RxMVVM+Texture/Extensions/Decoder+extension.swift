//
//  Decoder+extension.swift
//  RxMVVM+Texture
//
//  Created by minhoi_goo on 08/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import Foundation
import RxSwift

extension PrimitiveSequence where Element == Data {
  //.generateArrayModel(type: MODEL_CLASS_NAME.self).subscribe ... TODO
  func generateArrayModel<T: Decodable>() -> Single<[T]> {
    return self.asObservable()
    .flatMap( { data -> Observable<[T]> in
      let array = try? JSONDecoder().decode([T].self, from: data)
      return Observable.just(array ?? [])
    })
    .asSingle()
  }
  
  func generateObjectModel<T: Decodable>() -> Single<T?> {
    return self.asObservable()
    .flatMap({ data -> Observable<T?> in
      let object = try? JSONDecoder().decode(T.self, from: data)
      return Observable.just(object ?? nil)
    })
    .asSingle()
  }
}
