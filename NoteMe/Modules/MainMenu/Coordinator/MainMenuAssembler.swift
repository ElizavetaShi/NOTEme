//
//  MainMenuAssembler.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import UIKit

final class MainMenuAssembler {
    
    private init() {}
    
    static func make() -> UIViewController {

        let vm = MainMenuVM()
        let vc = MainMenuVC(viewModel: vm)
        return vc
    }
}
