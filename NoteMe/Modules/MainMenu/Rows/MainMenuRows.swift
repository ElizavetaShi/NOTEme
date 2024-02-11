//
//  MainMenuRows.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import UIKit

enum MainMenuRows: CaseIterable {
    case calendar
    case location
    case timer
    
    
    var title: String {
        switch self {
        case .calendar: return "Calendar"
        case .location: return "Location"
        case .timer: return "Timer"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .calendar: return .TabBarMenu.calendar
        case .location: return .TabBarMenu.location
        case .timer: return .TabBarMenu.timer
        
        }
    }
}

