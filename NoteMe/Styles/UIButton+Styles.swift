//
//  UIButton+Styles.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 31.10.23.
//

import UIKit

extension UIButton {
    
    static func yellowRoundedButton(_ title: String?) -> UIButton {
        
        let button = UIButton()
        button.backgroundColor = .appYellow
        button.cornerRadius = 5.0
        button.setTitle(title, for: .normal)
        button.setTitleColor(.appText, for: .normal)
        button.setTitleColor(.appText.withAlphaComponent(0.75), for: .highlighted)
        button.titleLabel?.font = .appBoldFont.withSize(17.0)
        return button
    }
    
    static func cancelButton() -> UIButton {
        let button = UIButton()
        button.cornerRadius = 5.0
        button.setBorder(width: 1.0, color: .appYellow)
        button.setTitle("auth_cancel_button".localized, for: .normal)
        button.setTitleColor(.appYellow, for: .normal)
        button.setTitleColor(.appYellow.withAlphaComponent(0.75), for: .highlighted)
        button.titleLabel?.font = .appBoldFont.withSize(17.0)
        return button
    }
    
    static func underlineYellowButton(_ title: String) -> UIButton {
        
        return underlineButton(title,
                               color: .appYellow,
                               font: .appBoldFont.withSize(17.0))
    }
    
    static func underlineGreyButton(_ title: String) -> UIButton {
        
        return underlineButton(title,
                               color: .appGreyText,
                               font: .appBoldFont.withSize(15.0))
    }
    
    static func underlineButton(_ title: String,
                                color: UIColor,
                                font: UIFont) -> UIButton {
        
        let button = UIButton()
        button.backgroundColor = .clear
        let normalAttr: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: color
        ]
        
        button.setAttributedTitle(.init(string: title,
                                        attributes: normalAttr) , for: .normal)
        
        let highlightedAttr: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color.withAlphaComponent(0.75),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: color.withAlphaComponent(0.75)
        ]
  
        button.setAttributedTitle(.init(string: title,
                                        attributes: highlightedAttr) , for: .highlighted)
        return button
    }
    
    static func plusButton(_ image: UIImage?) -> UIButton {
        let button = UIButton()
        button.setBackgroundImage(image, for: .normal)
        return button
    }
    
    static func settingsButton(_ title: String?, titleColor: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColor.withAlphaComponent(0.75), for: .highlighted)
        button.titleLabel?.font = .appFont.withSize(14.0)
        button.contentHorizontalAlignment = .left
        return button
    }
}
