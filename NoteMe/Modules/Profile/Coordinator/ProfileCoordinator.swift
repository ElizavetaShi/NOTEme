//
//  ProfileCoordinator.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 16.12.23.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    override func start() -> UIViewController {
        ProfileAssembler.make()
    }
}
