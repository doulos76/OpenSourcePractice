//
//  ViewController.swift
//  ScrollViewTest2
//
//  Created by minhoi_goo on 04/07/2019.
//  Copyright © 2019 minhoi_goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var safeGuide: UILayoutGuide!
  
  var scrollView: UIScrollView!
  var contentView: UIView!
  var firstLabel: UILabel!
  var secondLabel: UILabel!
  

  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    
    setupLayout()
  }
  
  

  
  // MARK:- Fileprivate Methods
  
  fileprivate func setupViews() {
    safeGuide = view.safeAreaLayoutGuide
    
    scrollView = UIScrollView()
    scrollView.backgroundColor = .white
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1500)
    scrollView.bounces = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(scrollView)
    
    contentView = UIView()
    contentView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(contentView)
    
    
    firstLabel = UILabel()
    firstLabel.text = "First Label"
    firstLabel.textAlignment = .center
    firstLabel.textColor = .black
    firstLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(firstLabel)
    
    secondLabel = UILabel()
    secondLabel.text = "Second Label"
    secondLabel.textAlignment = .center
    secondLabel.textColor = .black
    secondLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(secondLabel)
  }
  
  fileprivate func setupLayout() {
    // Set scroll view anchor
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: self.safeGuide.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: self.safeGuide.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: self.safeGuide.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: self.safeGuide.trailingAnchor)
      ])
    
    // Set contentView anchor
    NSLayoutConstraint.activate([
      contentView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
      contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
      contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
      contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
      ])
    
    // Set first label anchor on scroll view
    NSLayoutConstraint.activate([
      firstLabel.widthAnchor.constraint(equalToConstant: 70),
      firstLabel.heightAnchor.constraint(equalToConstant: 30),
      firstLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100)
      ])
    
    // Set second label anchor on scroll view
    NSLayoutConstraint.activate([
      secondLabel.widthAnchor.constraint(equalToConstant: 70),
      secondLabel.heightAnchor.constraint(equalToConstant: 30),
      secondLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      secondLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1000)
      ])
  }

}

