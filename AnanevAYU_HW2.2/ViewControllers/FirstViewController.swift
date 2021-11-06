//
//  FirstViewController.swift
//  AnanevAYU_HW2.2
//
//  Created by Anton Anan'eV on 05.11.2021.
//

import UIKit

protocol FirstViewControllerDelegate {
    func setNewValues(sliderRedNewValue: Float, sliderGreenNewValue: Float, sliderBlueValue: Float)
}


class FirstViewController: UIViewController {
    
    @IBAction func SettingsButton() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigatioonVC = segue.destination as? UINavigationController else { return }
        guard let lastVC = navigatioonVC.topViewController as? LastViewController else { return }
        lastVC.color = view.backgroundColor
        lastVC.delegate = self
    }
}
// MARK: - FirstViewControllerDelegate
extension FirstViewController: FirstViewControllerDelegate {
    func setNewValues(sliderRedNewValue: Float, sliderGreenNewValue: Float, sliderBlueValue: Float) {
        view.backgroundColor = UIColor(red: CGFloat(sliderRedNewValue),
                                       green: CGFloat(sliderGreenNewValue),
                                       blue: CGFloat(sliderBlueValue),
                                       alpha: 1.0)
    }
}
