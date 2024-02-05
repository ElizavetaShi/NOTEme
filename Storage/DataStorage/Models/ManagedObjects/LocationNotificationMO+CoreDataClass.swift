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
class LocationNotificationMO: BaseNotificationMO {
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
