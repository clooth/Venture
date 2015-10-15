//
//  ViewController.swift
//  VentureDemo
//
//  Created by Nico Hämäläinen on 15/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tap = UITapGestureRecognizer(target: self, action: "tapped")
    view.addGestureRecognizer(tap)
  }
  
  func tapped() {
    self.performSegueWithIdentifier("ShowGameView", sender: self)
  }
  
}

