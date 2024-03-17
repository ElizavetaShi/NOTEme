//
//  HomeVM.swift
//  NoteMe
//
//  Created by admin on 7.02.24.
//

import UIKit
import CoreData
import Storage

protocol HomeAdapterProtocol: AnyObject {
    func reloadData(_ dtoList: [any DTODescription])
    
    var tapButtonOnDTO: ((_ sender: UIView, _ dto: any DTODescription) -> Void)? { get set }
}

protocol HomeCoordinatorProtocol {
    func showMenu(sender: UIView, delegate: MenuPopoverDelegate)
    func startEdit(dto: any DTODescription)
}


final class HomeVM: HomeViewModelProtocol {
    
    private let frcService: FRCService<BaseNotificationDTO>
    private let adapter: HomeAdapterProtocol
    private let coordinator: HomeCoordinatorProtocol
    private let storage: AllNotificationStorage
    
    private var selectedDTO: (any DTODescription)?

    init(frcService:  FRCService<BaseNotificationDTO>, adapter: HomeAdapterProtocol) {
        self.frcService = frcService
        self.adapter = adapter

        bind()
        
        frcService.startHandle()
    }

    private func bind() {
        frcService.didChangeContent = { [weak adapter] dtoList in
            adapter?.reloadData(dtoList)
            
            adapter?.tapButtonOnDTO = { [weak self] sender, dto in
                guard let self else { return }
                self.selectedDTO = dto
                self.coordinator.showMenu(sender: sender, delegate: self)
            }
        }
    }
    
    func viewDidLoad() {
        
    }
}


extension HomeVM: MenuPopoverDelegate {
    func didSelect(action: MenuPopoverVC.Action) {
        guard let dto = selectedDTO else { return }
        switch action {
            
        case .edit: coordinator.startEdit(dto: dto)
//        case .delete: storage.delete(dto: dto)
//            coordinator start to delete
        default: break
        }
    }
}
