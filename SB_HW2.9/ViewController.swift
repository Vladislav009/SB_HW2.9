//
//  ViewController.swift
//  SB_HW2.9
//
//  Created by Vladislav Kulak on 04.08.2021.
//

import Spring

class ViewController: UIViewController {
    
    private var animation = Animation()
    
    @IBOutlet weak var mainView: SpringView!
    @IBOutlet weak var runButton: SpringButton!
    @IBOutlet weak var currentAnimationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 10
        runButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func runSpringButton(_ sender: SpringButton) {
        currentAnimationLabel.text = animation.currentRandom
        mainView.animation = animation.currentRandom
        runButton.setTitle(getNextRandom(), for: .normal)
        mainView.force = 2
        mainView.duration = 1
        mainView.delay = 0.3
        mainView.animate()
    }
}

extension ViewController {
    func getRandomType() -> String {
        return animation.animationType.randomElement()?.rawValue ?? "Pop"
    }
    
    func getNextRandom() -> String {
        animation.nextRandom = getRandomType()
        animation.currentRandom = animation.nextRandom
        return animation.nextRandom
    }
}



