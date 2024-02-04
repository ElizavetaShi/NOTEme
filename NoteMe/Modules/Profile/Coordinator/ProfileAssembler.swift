//
//  ProfileAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 16.12.23.
//

import UIKit

final class ProfileAssembler {
    
    private init() {}
    
    static func make(container: Container, coordinator: ProfileCoordinatorProtocol) -> UIViewController {
        
        let authService: AuthService = container.resolve()
        let alertService: AlertService = container.resolve()
        let adapter = ProfileAdapter()
        let vm = ProfileVM(adapter: adapter,
                           authService: authService,
                           alertService: alertService,
                           coordinator: coordinator)
        
        return ProfileVC(viewModel: vm)
    }
}
