//
//  UILabel+Style.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 3.11.23.
//

import UIKit

extension UILabel {
    
    static func headLabel(_ text: String?) -> UILabel {
        
        let label = UILabel()
        label.font = .appBoldFont.withSize(25.0)
        label.textColor = .appText
        label.text = text
        label.textAlignment = .center
        return label
    }
    
    
}
