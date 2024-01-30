//
//  ProfileSections.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 23.01.24.
//

import UIKit

enum ProfileSections {
    
    case account(String)
    case settings([ProfileSettingsRows])
    
    var numberOfRows: Int {
        switch self {
        case .settings(let rows): return rows.count
        default: return 1
        }
    }
    
    var headerText: String {
        switch self {
        case .account: return "Account".localized
        case .settings(_): return "Settings".localized
        }
    }
}

enum ProfileSettingsRows: CaseIterable {
    
    case notifications
    case export
    case logout
    
    var icon: UIImage {
        switch self {
        case .notifications: return UIImage(named: "notifications")!
        case .export: return UIImage(named: "export")!
        case .logout: return UIImage(named: "logout")!

        }
    }
    
    var title: String {
        switch self {
        case .notifications: return "Notifications".localized
        case .export: return "export".localized
        case .logout: return "Logout".localized
        }
    }
    
    var infoText: String? {
        switch self {
        case .export: return "Now"
        default: return nil
        }
    }
}
