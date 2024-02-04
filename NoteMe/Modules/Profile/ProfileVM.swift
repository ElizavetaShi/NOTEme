//
//  ProfileVM.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 23.01.24.
//

import UIKit

protocol ProfileCoordinatorProtocol: AnyObject {
    func finish()
}

protocol ProfileAdapterProtocol {
    var didSelectRow: ((ProfileSettingsRows) -> Void)? { get set }
    func reloadData(with sections: [ProfileSections])
    func makeTableView() -> UITableView
}

protocol ProfileAuthServiceUseCase {
    func getUserEmail() -> String?
    func logout(completion: @escaping (Bool) -> Void)
}

protocol ProfileAlertServiceUseCase {
    func showAlert(title: String?,
                   message: String?,
                   cancelTitle: String?,
                   okTitle: String?,
                   okHandler: (() -> Void)?)
    func showAlert(title: String, message: String, okTitle: String)
}

final class ProfileVM: ProfileViewModelProtocol {
    
    private enum L10n {
        static let logout: String = "logout_title".localized
        static let logoutMessage: String = "logout_message".localized
        static let cancel: String = "cancel_message".localized
        static let ok: String = "ok_message".localized
    }
    var username: String = ""
    
    private var adapter: ProfileAdapterProtocol
    private let authService: ProfileAuthServiceUseCase
    private let alertService: ProfileAlertServiceUseCase
    
    private weak var coordinator: ProfileCoordinatorProtocol?
    
    init(adapter: ProfileAdapterProtocol, authService: ProfileAuthServiceUseCase, alertService: ProfileAlertServiceUseCase,
         coordinator: ProfileCoordinatorProtocol) {
        self.adapter = adapter
        self.authService = authService
        self.alertService = alertService
        self.coordinator = coordinator
        commonInit()
        bind()
    }
    
    private var sections: [ProfileSections] {
        return [
            .account(authService.getUserEmail() ?? ""),
            .settings(ProfileSettingsRows.allCases)]
    }
    
    private func bind() {
        adapter.didSelectRow = { [weak self] row in
            switch row {
            case .notifications: break
            case .export: break
            case .logout: self?.logout()
            }
        }
    }
    
    func makeTableView() -> UITableView {
        return adapter.makeTableView()
    }
}


private extension ProfileVM {
    
    private func commonInit() {
        setUserName()
        adapter.reloadData(with: sections)
    }
    
    private func setUserName() {
        username = authService.getUserEmail() ?? ""
    }
    
    private func logout() {
        
        alertService.showAlert(title: L10n.logout,
                               message: L10n.logoutMessage + "\(username)?",
                               cancelTitle: L10n.cancel,
                               okTitle: L10n.ok,
                               okHandler: { self.logoutDidTap()
        })
    }
    
    private func logoutDidTap() {
        authService.logout { [weak self] isSuccess in
            if isSuccess {
                ParametersHelper.set(.authenticated, value: false)
                self?.coordinator?.finish()
            } else {
                self?.alertService.showAlert(title: "Error", message: "Something went wrong", okTitle: "Ok")
            }
        }
    }
}
