//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by minhoi_goo on 03/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let imageView = UIImageView(image: UIImage(named: "image"))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let scrollView = UIScrollView(frame: view.bounds)
    view.addSubview(scrollView)
    scrollView.delegate = self
    scrollView.addSubview(imageView)
    scrollView.contentSize = imageView.bounds.size
    scrollView.maximumZoomScale = 3.0
    scrollView.minimumZoomScale = 0.1
  }


}

extension ViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
}

