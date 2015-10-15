//
//  GameViewController.swift
//  VentureDemo
//
//  Created by Nico Hämäläinen on 16/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//

import UIKit
import Venture

class GameViewController: UIViewController {
    
    // MARK: Game information
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let player = Character(name: "John Doe", gender: .Male)
        let company = Company(name: "Corp Inc Ltd.")
        company.hire(player)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
