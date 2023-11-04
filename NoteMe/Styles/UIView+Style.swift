//
//  UIView+Style.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 28.10.23.
//

import UIKit

extension UIView {
    
    static func mainView(_ color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(1.0)
        view.cornerRadius = 5.0
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = 4
        view.layer.shadowRadius = 0
        view.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        return view
    }
    
    static func separatorView(_ color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
}
