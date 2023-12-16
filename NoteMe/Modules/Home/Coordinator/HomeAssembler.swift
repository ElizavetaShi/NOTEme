//
//  HomeAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 12.12.23.
//

import UIKit

final class HomeAssembler {
    
    private init() {}
    
    static func make() -> UIViewController {
        return HomeVC()
    }
}
