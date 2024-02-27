//
//  HomeVM.swift
//  NoteMe
//
//  Created by admin on 7.02.24.
//

import Foundation
import CoreData
import Storage

protocol HomeAdapterProtocol:AnyObject {
    func reloadData(_ dtoList: [any DTODescription])
}


final class HomeVM: HomeViewModelProtocol {
    
    private let frcService: FRCService<BaseNotificationDTO>
    private let adapter: HomeAdapterProtocol

    init(frcService:  FRCService<BaseNotificationDTO>, adapter: HomeAdapterProtocol) {
        self.frcService = frcService
        self.adapter = adapter

        bind()
        
        frcService.startHandle()
    }

    private func bind() {
        frcService.didChangeContent = { [weak adapter] dtoList in
            adapter?.reloadData(dtoList)
        }
    }
    
    func viewDidLoad() {
        <#code#>
    }
    
}
