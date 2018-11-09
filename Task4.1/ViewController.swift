//
//  ViewController.swift
//  Task4.1
//
//  Created by Natallia Zubareva on 11/8/18.
//  Copyright © 2018 Natallia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewsInput: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    
    let labelValues = ["Первый блок", "Второй блок", "Третий блок"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewsInput.delegate = self
    }
    
    func createView(_ labelText: String) -> UIView {
        let view = UIView.createUIView()
        
        // create label and add it to the view
        let label = UILabel.createLabel()
        label.text = labelText
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelLeadingConstraint = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let labelTrailingConstraint = NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let labelTopConstraint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 20)
        
        // create button and add it to the view
        let button = UIButton.createButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonLeadingConstraint = NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
        let buttonTrailingConstraint = NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        let buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1, constant: 20)
        
        // activate constraints
        NSLayoutConstraint.activate([labelLeadingConstraint, labelTrailingConstraint, labelTopConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonTopConstraint])
        return view
    }
    
    func createErrorView(_ errorText: String) -> UIView {
        let view = UIView.createUIView()
        // create label and add it to the view
        let label = UILabel.createLabel()
        label.text = errorText
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelLeadingConstraint = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let labelTrailingConstraint = NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let labelTopConstraint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([labelLeadingConstraint, labelTrailingConstraint, labelTopConstraint])
        return view
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        stackView.arrangedSubviews.forEach{$0.removeFromSuperview()}
        
        let input:Int? = Int(textField.text ?? "-1")
        guard let amount = input else {
            stackView.addArrangedSubview(createErrorView("Введено нечисловое значение"))
            return true
        }
        if amount < 1 || amount > 3 {
            stackView.addArrangedSubview(createErrorView("Не в диапазоне 1..3"))
            return true
        }
        
        for i in 0..<amount {
            stackView.addArrangedSubview(createView(labelValues[i]))
        }
        
        return true
        
    }
    
}

