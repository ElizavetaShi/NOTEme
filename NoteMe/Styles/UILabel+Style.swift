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
        return label
    }
    
    static func menuLabel(_ text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .appFont.withSize(16.0)
        label.textColor = .appText
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }
    
    static func attributedText(_ font: UIFont) -> NSAttributedString {
        let calendarKey = NSLocalizedString("onboard2_calendar_label",
                                            comment: "")
        let locationKey = NSLocalizedString("onboard2_location_label",
                                            comment: "")
        let timerKey = NSLocalizedString("onboard2_timer_label",
                                         comment: "")
        let labelText = NSLocalizedString("onboard2_info_label_text",
                                          comment: "")
        
        let attributedText = NSMutableAttributedString(string: labelText)
        
        let wordsToBold = [calendarKey, locationKey, timerKey]
        
        for word in wordsToBold {
            if let range = labelText.range(of: word) {
                let nsRange = NSRange(range, in: labelText)
                attributedText.addAttribute(.font, value: font, range: nsRange)
            }
        }
        return attributedText
    }
    
    static func infoLabelWithAttributedText() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .appFont.withSize(13.0)
        
        label.attributedText = attributedText(.appBoldFont.withSize(13.0))
        return label
    }
}
