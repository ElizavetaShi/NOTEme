//
//  UIButton+Style.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 28.10.23.
//

import UIKit

extension UIButton {
    
    func yellowButtonStyle() {
        self.backgroundColor = .appYellow
        self.layer.cornerRadius = 5.0
        self.setTitleColor(.appBlack, for: .normal)
        self.titleLabel?.font = .appBoldFont.withSize(17.0)
    }
    
    func underlineButtonStyle() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes(
            [.underlineStyle: NSUnderlineStyle.single.rawValue,
             .underlineColor: UIColor.buttonGrey],
            range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
