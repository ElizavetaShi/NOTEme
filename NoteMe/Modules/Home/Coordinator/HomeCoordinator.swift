//
//  HomeCoordinator.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 12.12.23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    override func start() -> UIViewController {
        let vm = HomeVM(frcService: <#FRCService<BaseNotificationDTO>#>, adapter: <#HomeAdapterProtocol#>)
        return HomeAssembler.make()
    }
}
