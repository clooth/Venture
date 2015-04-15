//
//  Functions.swift
//  Dare
//
//  Created by Nico Hämäläinen on 15/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//
import Foundation

///  Delay the execution of a block by a given amount of seconds
///
///  :param: delay   The delay in seconds
///  :param: closure The block to execute
public func delay(delay: Double, closure: () -> ()) {
    let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(delay, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), closure)
}