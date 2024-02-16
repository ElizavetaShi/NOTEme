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

protocol DateNotificationInputValidatorUseCase {
    func validate(title: String?) -> Bool
    func validate(date: Date?) -> Bool
}

final class DateNotificationVM: DateNotificationViewModelProtocol {
    
    var catchTitleError: ((String?) -> Void)?
    var catchDateError: ((String?) -> Void)?
    
    private weak var coordinator: DateNotificationCoordinatorProtocol?
    private let storage: DateNotificationStorage
    private let inputValidator: DateNotificationInputValidatorUseCase
    
    init(coordinator: DateNotificationCoordinatorProtocol,
         storage: DateNotificationStorage,
         inputValidator: DateNotificationInputValidatorUseCase) {
        self.coordinator = coordinator
        self.storage = storage
        self.inputValidator = inputValidator
    }

//    func createButtonDidTap(title: String?, date: Date?, comment: String?) {
//        
//        guard let title = title,
//                let date = date,
//                let comment = comment,
//              checkValidation(title: title, date: date)
//
//        else { return }
//        let dto = DateNotificationDTO(date: Date(),
//                                      id: UUID().uuidString,
//                                      title: title,
//                                      subtitle: comment,
//                                      targetDate: date + 10000)
//        storage.create(dto: dto)
//        coordinator?.finish()
//    }

    func cancelButtonDidTap() {
        coordinator?.finish()
    }
    
    private func checkValidation(title: String?, date: Date?) -> Bool {
        guard let title = title, let date = date else { return false }
        let isTitleValid = inputValidator.validate(title: title)
        let isDateValid = inputValidator.validate(date: date)
        
        catchTitleError?(isTitleValid ? nil : "Tltle is empty!")
        catchDateError?(isDateValid ? nil : "Date is not selected!")
        
        return isTitleValid && isDateValid
    }
}
