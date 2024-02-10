//
//  DateNotificationMO+CoreDataClass.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 4.02.24.
//
//

import Foundation
import CoreData

@objc(DateNotificationMO)
public class DateNotificationMO: BaseNotificationMO {
    func apply(dto: DateNotificationDTO) {
        self.identifier = dto.id
        self.date = dto.date
        self.title = dto.title
        self.subtitle = dto.subtitle
        self.completedDate = dto.completedDate
        self.targetDate = dto.targetDate
    }
}

extension DateNotificationMO: MODescription {
    public func apply<Type>(_ dto: Type) where Type : DTODescription {
        guard let specificDTO = dto as? DateNotificationDTO else { return }
        self.apply(dto: specificDTO)
    }
}
