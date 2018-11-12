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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewsInput.delegate = self
        view.backgroundColor = .black
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
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonLeadingConstraint = NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
        let buttonTrailingConstraint = NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)
        let buttonTopConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1, constant: 20)
        
        view.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        
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
    
    @objc func buttonAction(_ sender: UIButton!) {
        sender.superview?.removeFromSuperview()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        stackView.arrangedSubviews.forEach{$0.removeFromSuperview()}
        
        let input:Int? = Int(textField.text ?? "-1")
        guard let amount = input else {
            stackView.addArrangedSubview(createErrorView("Введено нечисловое значение"))
            return true
        }
        if amount < 1 || amount > 100 {
            stackView.addArrangedSubview(createErrorView("Не в диапазоне 1..100"))
            return true
        }
        
        for i in 0..<amount {
            stackView.addArrangedSubview(createView("Блок № \(i+1)"))
        }
        
        return true
        
    }
    
}

