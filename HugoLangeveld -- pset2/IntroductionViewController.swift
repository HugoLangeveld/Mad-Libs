//
//  IntroductionViewController.swift
//  HugoLangeveld -- pset2
//
//  Created by Hugo Langeveld on 08/12/2018.
//  Copyright © 2018 Hugo Langeveld. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    var text = ""
    
    @IBAction func unwindToIntroduction(segue: UIStoryboardSegue) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func textButtonPressed(_ sender: UIButton) {
        var name = ""
        switch sender.title(for: .normal) {
        case "Simple":
            name = "madlib0_simple"
        case "Tarzan":
            name = "madlib1_tarzan"
        case "University":
            name = "madlib2_university"
        case "Clothes":
            name = "madlib3_clothes"
        case "Dance":
            name = "madlib4_dance"
        default:
            name = ""
        }
        
        let storyPath = Bundle.main.path(forResource: name, ofType: "txt")
        text = try! String(contentsOfFile: storyPath ?? name, encoding: .utf8)
        performSegue(withIdentifier: "WriteSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WriteSegue" {
            let writeViewController = segue.destination as! WriteViewController
            writeViewController.story = Story(withText: text)
        }
    }


}
