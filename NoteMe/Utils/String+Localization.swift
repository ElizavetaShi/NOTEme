//
//  String+Localization.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 7.11.23.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
