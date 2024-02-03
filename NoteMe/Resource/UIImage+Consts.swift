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
        static let onboardStep2: UIImage? = .init(named: "onboardStep2")
        static let notifications: UIImage? = .init(named: "notification")
        static let export: UIImage? = .init(named: "export")
        static let logout: UIImage? = .init(named: "logout")
    }
    
    enum Profile {
        static let profile: UIImage? = .init(named: "profile")
        static let notifications: UIImage? = .init(named: "notification")
        static let export: UIImage? = .init(named: "export")
        static let logout: UIImage? = .init(named: "logout")
    }
}
