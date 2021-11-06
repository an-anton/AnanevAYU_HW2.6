//
//  ViewController.swift
//  AnanevAYU_HW2.2
//
//  Created by Anton Anan'eV on 21.10.2021.
//

import UIKit

class LastViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet var viewColor: UIView!
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    @IBOutlet var labelValueRed: UILabel!
    @IBOutlet var labelValueGreen: UILabel!
    @IBOutlet var labelValueBlue: UILabel!
    @IBOutlet var textFields: [UITextField]!
    
    //MARK: - public properties
    var color: UIColor!
    var delegate: FirstViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.backgroundColor = color
        viewColor.layer.cornerRadius = viewColor.frame.height / 9
        superViewColorDecomposition()
        createToolBar()
    }
    
    //MARK: - IBActions
    @IBAction func sliderRedAction() {
        changeBackgroundView()
    }
    
    @IBAction func sliderGreenAction() {
        changeBackgroundView()
    }
    
    @IBAction func sliderBlueAction() {
        changeBackgroundView()
    }
    
    @IBAction func doneButton() {
        view.endEditing(true)
        delegate.setNewValues(sliderRedNewValue: sliderRed.value,
                              sliderGreenNewValue: sliderGreen.value,
                              sliderBlueValue: sliderBlue.value)
        dismiss(animated: true)
    }
    //MARK: - Private methods
    private func superViewColorDecomposition() {
        
        guard let colorBackground = color.cgColor.components else {return}
        sliderRed.value = Float(colorBackground[0])
        sliderGreen.value = Float(colorBackground[1])
        sliderBlue.value = Float(colorBackground[2])
        changesLabelValueAndTextFLs()
    }
    
    private func changesLabelValueAndTextFLs() {
        labelValueRed.text = String(format: "%.2f", sliderRed.value)
        labelValueGreen.text = String(format: "%.2f", sliderGreen.value)
        labelValueBlue.text = String(format: "%.2f", sliderBlue.value)
        
        textFields[0].text = labelValueRed.text
        textFields[1].text = labelValueGreen.text
        textFields[2].text = labelValueBlue.text
    }
    
    private func changeBackgroundView() {
        viewColor.backgroundColor = UIColor(red: CGFloat(sliderRed.value),
                                            green: CGFloat(sliderGreen.value),
                                            blue: CGFloat(sliderBlue.value),
                                            alpha: 1.0)
        changesLabelValueAndTextFLs()
    }
    
    private func createToolBar() {
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: view.frame.size.width,
                                              height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        let doneButton = UIBarButtonItem(title: "done",
                                         style: .done,
                                         target: self,
                                         action: #selector(doneClicked))
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        textFields[0].inputAccessoryView = toolBar
        textFields[1].inputAccessoryView = toolBar
        textFields[2].inputAccessoryView = toolBar
    }
    @objc func doneClicked() {
        view.endEditing(true)
    }
}
//MARK: - Extension
extension LastViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }

        if textField == textFields[0] {
            sliderRed.setValue(numberValue, animated: true)
            changesLabelValueAndTextFLs()
            changeBackgroundView()
            
        } else if textField == textFields[1] {
            sliderGreen.setValue(numberValue, animated: true)
            changesLabelValueAndTextFLs()
            changeBackgroundView()
            
        } else if textField == textFields[2] {
            sliderBlue.setValue(numberValue, animated: true)
            changesLabelValueAndTextFLs()
            changeBackgroundView()
        }
    }
}
