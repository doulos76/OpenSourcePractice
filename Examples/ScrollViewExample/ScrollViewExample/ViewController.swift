//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by minhoi_goo on 04/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK:- Properties
  
  let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height)
    scrollView.alwaysBounceHorizontal = true
    scrollView.isPagingEnabled = true
//    scrollView.backgroundColor = .yellow
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  let contentsView: UIView = {
    let view = UIView()
    view.backgroundColor = .yellow
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let blueView: UIView = {
    let view = UIView()
    view.backgroundColor = .blue
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let greenView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let redView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()


  // MARK:- View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupLayout()
  }
  
  // MARK:- Methods
  
  fileprivate func setupViews() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentsView)
    contentsView.addSubview(blueView)
    contentsView.addSubview(greenView)
    contentsView.addSubview(redView)
  }
  
  fileprivate func setupLayout() {
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
    
    NSLayoutConstraint.activate([
      contentsView.topAnchor.constraint(equalTo: view.topAnchor),
      contentsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contentsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      contentsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])

    
    NSLayoutConstraint.activate([
      blueView.topAnchor.constraint(equalTo: contentsView.topAnchor),
      blueView.bottomAnchor.constraint(equalTo: contentsView.bottomAnchor),
      blueView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
      blueView.widthAnchor.constraint(equalToConstant: contentsView.bounds.width / 3)
      ])

//    NSLayoutConstraint.activate([
//      greenView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//      greenView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor),
//      greenView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
//      greenView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
//      ])
//
//    NSLayoutConstraint.activate([
//      redView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//      //redView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//      redView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//      redView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
//      ])
  }
}
