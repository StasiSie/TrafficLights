//
//  ViewController.swift
//  TrafficLights
//
//  Created by Игорь Богданов on 20.03.2022.
//

import UIKit

enum Lights {
    case red, yellow, green
}
class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var nextButton: UIButton!
    private var currentLight = Lights.red
    private let lightOn:CGFloat = 1
    private let lightOff:CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.alpha = lightOff
        yellowView.alpha = lightOff
        greenView.alpha = lightOff
        nextButton.layer.cornerRadius = 30
    }
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width/2
        yellowView.layer.cornerRadius = yellowView.frame.width/2
        greenView.layer.cornerRadius = greenView.frame.width/2
    }

    @IBAction  func changingLightsNextButton() {
        if nextButton.currentTitle == "Start"{
            nextButton.setTitle("Next", for: .normal)
        } 
        switch currentLight {
        case .red:
            greenView.alpha = lightOff
            redView.alpha = lightOn
            currentLight = .yellow
        case .yellow:
            redView.alpha = lightOff
            yellowView.alpha = lightOn
            currentLight = .green
        case .green:
            yellowView.alpha = lightOff
            greenView.alpha = lightOn
            currentLight = .red
       
        }
    }
}
