//
//  ResetAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 19.11.23.
//

import UIKit

final class ResetAssembler {
    
    private init() {}
    
    static func make(coordinator: ResetCoordinatorProtocol) -> UIViewController {
        
        let vm = ResetVM(coordinator: coordinator,
                         authService: TESTAuthService(),
                         inputValidator: InputValidator())
        return ResetVC(viewModel: vm)
    }
}

private class TESTAuthService: ResetAuthServiceUseCase {
    func reset(email: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
}
