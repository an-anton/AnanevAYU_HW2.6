//
//  ViewController.swift
//  AnanevAYU_HW2.2
//
//  Created by Anton Anan'eV on 21.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var labelValueRed: UILabel!
    @IBOutlet var labelValueGreen: UILabel!
    @IBOutlet var labelValueBlue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderRed.value = 0
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 1
        sliderRed.minimumTrackTintColor = .red
        labelValueRed.text = "0.00"
        
        sliderGreen.value = 0
        sliderGreen.maximumValue = 1
        sliderGreen.minimumValue = 0
        sliderGreen.minimumTrackTintColor = .green
        labelValueGreen.text = "0.00"
        
        sliderBlue.value = 0
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 1
        sliderBlue.minimumTrackTintColor = .blue
        labelValueBlue.text = "0.00"
    }

    override func viewWillLayoutSubviews() {
        viewColor.layer.cornerRadius = viewColor.frame.height / 9
        
        let colorForView = CGColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1.0)
        viewColor.backgroundColor = UIColor(cgColor: colorForView)
    }

    @IBAction func sliderRedAction() {
        labelValueRed.text = String(format: "%.2f", sliderRed.value)
    }
    
    @IBAction func sliderGreenAction() {
        labelValueGreen.text = String(format: "%.2f", sliderGreen.value)
    }
    
    @IBAction func sliderBlueAction() {
        labelValueBlue.text = String(format: "%.2f", sliderBlue.value)
    }
}

