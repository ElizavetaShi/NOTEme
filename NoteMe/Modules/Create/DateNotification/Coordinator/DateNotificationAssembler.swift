//
//  DateNotificationAssembler.swift
//  NoteMe
//
//  Created by admin on 9.02.24.
//

import UIKit
import Storage

final class DateNotificationAssembler {
    
    private init() {}
    
    static func make(coordinator: DateNotificationCoordinatorProtocol,
                     container: Container) -> UIViewController {
        let storage: DateNotificationStorage = container.resolve()
        let inputValidator: InputValidator = container.resolve()
        let vm = DateNotificationVM(coordinator: coordinator, storage: storage, inputValidator: inputValidator)
        return DateNotificationVC(viewModel: vm)
    }
}
