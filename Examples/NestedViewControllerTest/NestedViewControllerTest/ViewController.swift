//
//  ViewController.swift
//  NestedViewControllerTest
//
//  Created by minhoi_goo on 15/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.backgroundColor = .green
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
    return scrollView
  }()
  
  lazy var contentsView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var redView: UIView = RedViewController().view!
  var blueView: UIView = BlueViewController().view!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupLayout()
  }
  
  func setupView() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentsView)
    contentsView.addSubview(redView)
    contentsView.addSubview(blueView)
    
    contentsView.translatesAutoresizingMaskIntoConstraints = false
    redView.translatesAutoresizingMaskIntoConstraints = false
    blueView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func setupLayout() {
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      ])
    
    NSLayoutConstraint.activate([
      contentsView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      ])

    
    NSLayoutConstraint.activate([
      redView.topAnchor.constraint(equalTo: contentsView.topAnchor),
      redView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
      redView.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
      redView.heightAnchor.constraint(equalToConstant: 300)
      ])

    NSLayoutConstraint.activate([
      blueView.topAnchor.constraint(equalTo: redView.bottomAnchor),
      blueView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
      blueView.bottomAnchor.constraint(equalTo: contentsView.bottomAnchor),
      blueView.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
      ])
  }
}
