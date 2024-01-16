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
    
    static func infoLabel(_ text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .appFont.withSize(13.0)
        label.textColor = .appText
        label.textAlignment = .left
        label.numberOfLines = 0
        label.attributedText = .parse(html: text ?? "", font: .appFont.withSize(13.0))
        return label
    }
    
    static func menuLabel(_ text: String?, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .appFont.withSize(fontSize)
        label.textColor = .appText
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }
}
