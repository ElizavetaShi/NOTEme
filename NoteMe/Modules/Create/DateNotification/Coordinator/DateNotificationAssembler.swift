//
//  DateNotificationAssembler.swift
//  NoteMe
//
//  Created by admin on 9.02.24.
//

import UIKit

final class DateNotificationAssembler {
    
    private init() {}
    
    static func make() -> UIViewController {
     
        let vm = DateNotificationVM()
        return DateNotificationVC(viewModel: vm)
    }
}
