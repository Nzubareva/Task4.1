//
//  UIKitExtensions.swift
//  Task4.1
//
//  Created by Natallia Zubareva on 11/8/18.
//  Copyright © 2018 Natallia. All rights reserved.
//

import UIKit

extension UIView {
    static func createUIView() -> UIView {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }
}

extension UIButton {
    static func createButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.setTitle("Action", for: .normal)
        
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        
        return button
    }
}

extension UILabel {
    static func createLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = .black
        
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }
}

