//
//  Timer.swift
//  Venture
//
//  Created by Nico Hämäläinen on 15/10/15.
//  Copyright © 2015 sizeof.io. All rights reserved.
//

import Foundation
import Bond

public class Timer: NSObject {
  private var timer: NSTimer!

  public var days   = Observable<Int>(0)
  public var weeks  = Observable<Int>(0)
  public var months = Observable<Int>(0)
  public var years  = Observable<Int>(0)
  
  override init() {
    super.init()
  }
  
  
}