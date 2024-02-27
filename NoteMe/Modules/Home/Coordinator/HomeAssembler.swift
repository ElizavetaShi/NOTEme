//
//  HomeAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 12.12.23.
//

import UIKit
import Storage

final class HomeAssembler {
    
    private init() {}
    
    static func make() -> UIViewController {
        let vm = HomeVM(
        frcService: makeFRC(), adapter: HomeAdapterProtocol
        )
        return HomeVC(viewModel: vm)
    }
    
    private static func makeFRC() -> FRCService<BaseNotificationDTO> {
        return .init { request in
            request.predicate = .Notification.allNotCompleted
            request.sortDescriptors = [.Notification.byDate]
        }
    }
}
