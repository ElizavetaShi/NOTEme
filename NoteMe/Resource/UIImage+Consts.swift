//
//  UIImage+Consts.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 24.10.23.
//

import UIKit

extension UIImage {
   
    //MARK - General
    enum General {
        
        static let logo: UIImage? = .init(named: "logo")
    }
    
    enum Onboarding {
        static let onboardStep2: UIImage? = .init(named: "onboardStep2")

    }
    
    enum TabBar {
        static let plus: UIImage? = .init(named: "plus")
        
    }
    
    enum MenuAction {
        static let edit: UIImage? = .init(named: "edit")
        static let delete: UIImage? = .init(named: "delete")
        static let calendar: UIImage? = .init(named: "calendar")
        static let location: UIImage? = .init(named: "location")
        static let timer: UIImage? = .init(named: "timer")
    }
    
    enum Profile {
        static let profile: UIImage? = .init(named: "profile")
        static let notifications: UIImage? = .init(named: "notification")
        static let export: UIImage? = .init(named: "export")
        static let logout: UIImage? = .init(named: "logout")
        static let home: UIImage? = .init(named: "home")
    }
    
    enum TabBarMenu {
        static let timer: UIImage? = .init(named: "timer")
        static let calendar: UIImage? = .init(named: "calendar")
        static let location: UIImage? = .init(named: "location")
    }
}
