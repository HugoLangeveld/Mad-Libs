//
//  WriteViewController.swift
//  HugoLangeveld -- pset2
//
//  Created by Hugo Langeveld on 08/12/2018.
//  Copyright © 2018 Hugo Langeveld. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {
    
    var story: Story!
    
    @IBOutlet weak var wordsRemainingLabel: UILabel!

    @IBOutlet weak var fillPlaceholdersTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

    @IBAction func addWordButtonPressed(_ sender: UIButton) {
        addWord()
        if story.remainingPlaceholders > 0 {
            updateUI()
        }
        else {
            performSegue(withIdentifier: "ReadSegue", sender: nil)
        }
    }
    
    func updateUI() {
        fillPlaceholdersTextField.text = nil
        wordsRemainingLabel.text = "Words remaining \(story.remainingPlaceholders)"
        fillPlaceholdersTextField.placeholder = story.nextPlaceholder?.lowercased()
    }
    
    func addWord() {
        let newWord = fillPlaceholdersTextField.text!
        story.fillInPlaceholder(word: newWord)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReadSegue" {
            let storyResultViewController = segue.destination as! StoryViewController
            storyResultViewController.text = story.normalText
        }
    }
    

}
