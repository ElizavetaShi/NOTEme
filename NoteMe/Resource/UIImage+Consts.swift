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
    
    enum Profile {
        static let profile: UIImage? = .init(named: "profile")
        static let notifications: UIImage? = .init(named: "notification")
        static let export: UIImage? = .init(named: "export")
        static let logout: UIImage? = .init(named: "logout")
        static let home: UIImage? = .init(named: "home")
    }
}
