//
//  TimerNotificationStorage.swift
//  Storage
//
//  Created by admin on 8.02.24.
//

import Foundation

public final class TimerNotificationStorage: NotificationStorage<TimerNotificationDTO> {
    
    public func fetch(predicate: NSPredicate? = nil,
                      sortDescriptors: [NSSortDescriptor] = []) -> [TimerNotificationDTO] {
        return super.fetch(predicate: predicate, sortDescriptors: sortDescriptors
        ).compactMap { $0 as? TimerNotificationDTO }
    }
}
