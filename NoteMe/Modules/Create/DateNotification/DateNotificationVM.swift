//
//  DateNotificationVM.swift
//  NoteMe
//
//  Created by admin on 9.02.24.
//

import Foundation
import Storage

protocol DateNotificationCoordinatorProtocol: AnyObject {
    func finish()
}

final class DateNotificationVM: DateNotificationViewModelProtocol {
    
    private weak var coordinator: DateNotificationCoordinatorProtocol?
    private let storage: DateNotificationStorage
    
    init(coordinator: DateNotificationCoordinatorProtocol,
         storage: DateNotificationStorage) {
        self.coordinator = coordinator
        self.storage = storage
    }

    func createButtonDidTap(title: String?, date: String?, comment: String?) {
        
        guard let title = title,
                let date = date,
                let comment = comment
        else { return }
        let dto = DateNotificationDTO(date: Date(),
                                      id: UUID().uuidString,
                                      title: title,
                                      subtitle: comment,
                                      targetDate: Date() + 10000)
        storage.create(dto: dto)
        coordinator?.finish()
    }

    func cancelButtonDidTap() {
        coordinator?.finish()
    }
}
