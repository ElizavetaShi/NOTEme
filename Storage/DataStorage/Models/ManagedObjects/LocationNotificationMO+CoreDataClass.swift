//
//  LocationNotificationMO+CoreDataClass.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 5.02.24.
//
//

import Foundation
import CoreData

@objc(LocationNotificationMO)
public class LocationNotificationMO: BaseNotificationMO {
    func apply(dto: LocationNotificationDTO) {
        self.identifier = dto.id
        self.title = dto.title
        self.subtitle = dto.subtitle
        self.date = date
        self.completedDate = dto.completedDate
        self.latitude = dto.latitude
        self.longitude = dto.longitude
    }
}

extension LocationNotificationMO: MODescription {
    public func apply<Type>(_ dto: Type) where Type : DTODescription {
        guard let specificDTO = dto as? LocationNotificationDTO else { return }
        self.apply(dto: specificDTO)
    }
}
