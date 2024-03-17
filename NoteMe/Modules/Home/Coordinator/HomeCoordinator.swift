//
//  HomeCoordinator.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 12.12.23.
//

import UIKit
import Storage

final class HomeCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    
    override func start() -> UIViewController {
        let vc = HomeAssembler.make()
        rootVC = vc
//        let vm = HomeVM(frcService: <#FRCService<BaseNotificationDTO>#>, adapter: <#HomeAdapterProtocol#>)
        return vc
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func startEdit(dto: any DTODescription) {
        
    }
    
    func showMenu(sender: UIView, delegate: any MenuPopoverDelegate) {
        let menu = MenuPopoverBuilder.buildEditMenu(delegate: delegate, sourceView: sender)
        rootVC?.present(menu, animated: true)
    }
}
