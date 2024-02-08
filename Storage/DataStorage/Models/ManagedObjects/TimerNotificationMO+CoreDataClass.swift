//
//  TimerNotificationMO+CoreDataClass.swift
//  Storage
//
//  Created by admin on 8.02.24.
//
//

import Foundation
import CoreData

@objc(TimerNotificationMO)
public class TimerNotificationMO: BaseNotificationMO {
    func apply(dto: TimerNotificationDTO) {
        self.identifier = dto.id
        self.date = dto.date
        self.title = dto.title
        self.subtitle = dto.subtitle
        self.completedDate = dto.completedDate
        self.targetDate = dto.targetDate
    }
}
