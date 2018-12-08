//
//  StoryViewController.swift
//  HugoLangeveld -- pset2
//
//  Created by Hugo Langeveld on 08/12/2018.
//  Copyright © 2018 Hugo Langeveld. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    var text: String!

    @IBOutlet weak var resultStoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        resultStoryLabel.text = text
    }
    
    
}
