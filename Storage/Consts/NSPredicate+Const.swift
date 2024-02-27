//
//  NSPredicate+Const.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 4.02.24.
//

import CoreData

public extension NSPredicate {
    enum Notification {
        
        public static var allNotCompleted: NSPredicate {
            let completedDateKeyPath = #keyPath(BaseNotificationMO.completedDate)
            return .init(format: "\(completedDateKeyPath) == NULL")
        }
        public static func notification(byId id: String) -> NSPredicate {
            let idKeyPath = #keyPath(BaseNotificationMO.identifier)
            return .init(format: "\(idKeyPath) CONTAINS[cd] $@", id)
        }
    }
}
