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
    func reloadData<Type: DTODescription>(_ dtoList: [Type])
}


final class HomeVM: HomeVMProtocol {
    
    private let frcService: FRCService<DateNotificationDTO>
    private let adapter: HomeAdapterProtocol
    
    init(frcService:  FRCService<DateNotificationDTO>, adapter: HomeAdapterProtocol) {
        self.frcService = frcService
        self.adapter = adapter
        
        bind()
    }
    
    private func bind() {
        frcService.didChangeContent = { [weak adapter] dtoList in
            adapter?.reloadData(dtoList)
        }
    }
    
}
