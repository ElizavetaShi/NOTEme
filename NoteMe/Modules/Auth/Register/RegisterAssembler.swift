//
//  RegisterAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 14.11.23.
//

import UIKit

final class RegisterAssembler {
    
    private init() {}
    
    static func make() -> UIViewController {
        let presenter = RegisterPresenter(keyboardHelper: .init())
        let vc = RegisterVC(presenter: presenter)
        presenter.delegate = vc
        return vc
    }
}
