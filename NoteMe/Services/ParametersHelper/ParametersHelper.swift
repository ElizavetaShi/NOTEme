//
//  ParametersHelper.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 28.11.23.
//

import UIKit

final class ParametersHelper {
    
    enum ParameterKey: String {
        case authenticated
        case onboarded
    }
    
    private static var ud: UserDefaults = .standard
    
    private init() {}
    
    static func set(_ key: ParameterKey, value: Bool) {
        ud.set(value, forKey: key.rawValue)
    }
    
    static func get(_ key: ParameterKey) -> Bool {
        return ud.bool(forKey: key.rawValue)
    }
}
