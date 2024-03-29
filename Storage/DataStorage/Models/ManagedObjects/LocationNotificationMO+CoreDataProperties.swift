//
//  LocationNotificationMO+CoreDataProperties.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 5.02.24.
//
//

import Foundation
import CoreData


extension LocationNotificationMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationNotificationMO> {
        return NSFetchRequest<LocationNotificationMO>(entityName: "LocationNotificationMO")
    }

    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double

}
