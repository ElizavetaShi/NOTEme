//
//  NSPredicate+Const.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 4.02.24.
//

import CoreData

extension NSPredicate {
    enum Notification {
        static func notification(byId id: String) -> NSPredicate {
            let idKeyPath = #keyPath(BaseNotificationMO.identifier)
            return .init(format: "\(idKeyPath) CONTAINS[cd] $@", id)
        }
    }
}
