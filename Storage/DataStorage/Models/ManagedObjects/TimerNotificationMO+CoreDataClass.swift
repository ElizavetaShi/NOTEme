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

extension TimerNotificationMO: MODescription {
    public func apply<Type>(_ dto: Type) where Type : DTODescription {
        guard let specificDTO = dto as? TimerNotificationDTO else { return }
        self.apply(dto: specificDTO)
    }
}
