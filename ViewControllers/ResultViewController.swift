//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelSubResult: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        labelSubResult.text = getResultAnimal()
        labelResult.text = "Вы" + String(getImageResult())
        

    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
//MARK: - ResultAnimal
private extension ResultViewController {
    
    func getResultAnimal() -> String {
        var desc: String!
        
        let counts = answers.reduce(into: [:]) { counts, element in counts[element.animal, default: 0] += 1 }
        
        if let maxValue = counts.max(by: { $0.value > $1.value }) {
            desc = maxValue.key.definition
        }
        return desc
        
        }
    
    func getImageResult() -> Character {
        
        var image: Character!
        
        let counts = answers.reduce(into: [:]) { counts, element in counts[element.animal, default: 0] += 1 }
        
        if let maxValue = counts.max(by: { $0.value > $1.value }) {
            image = maxValue.key.rawValue
        }
        
        return image
    }
}

