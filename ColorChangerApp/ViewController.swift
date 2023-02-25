//
//  ViewController.swift
//  ColorChangerApp
//
//  Created by Serj Andreev on 22.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
//    @IBOutlet var colorOne: UILabel!
    @IBOutlet var labelOne: UILabel!
    @IBOutlet var sliderOne: UISlider!
    
//    @IBOutlet var colorTwo: UILabel!
    @IBOutlet var labelTwo: UILabel!
    @IBOutlet var sliderTwo: UISlider!
    
//    @IBOutlet var colorThree: UILabel!
    @IBOutlet var labelThree: UILabel!
    @IBOutlet var sliderThree: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        sliderLimits(for: sliderOne)
        sliderLimits(for: sliderTwo)
        sliderLimits(for: sliderThree)
        
        sliderOne.minimumTrackTintColor = .red
        sliderTwo.minimumTrackTintColor = .green
        sliderThree.minimumTrackTintColor = .blue
        
        labelOne.text = stringer(from: sliderOne)
        labelTwo.text = stringer(from: sliderTwo)
        labelThree.text = stringer(from: sliderThree)
        
        colorView.layer.cornerRadius = 15
        setColor()
    }

    @IBAction func sliderOneAction(_ sender: UISlider) {
        switch sender {
        case sliderOne: sliderAction(from: labelOne, for: sliderOne)
        case sliderTwo: sliderAction(from: labelTwo, for: sliderTwo)
        default: sliderAction(from: labelThree, for: sliderThree)
        }
    }
    
    func sliderLimits(for slider : UISlider) {
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.2
    }
    
    func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(sliderOne.value),
            green: CGFloat(sliderTwo.value),
            blue: CGFloat(sliderThree.value),
            alpha: 1)
    }
    
    func sliderAction(from label : UILabel, for slider : UISlider) {
        label.text = stringer(from: slider)
        setColor()
    }

    func stringer(from slider : UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

