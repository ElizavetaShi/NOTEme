//
//  LocationNotificationDTO.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 5.02.24.
//

import UIKit

public struct LocationNotificationDTO {
    
        
    
     public var date: Date
     public var id: String
     public var title: String
     public var subtitle: String?
     public var completedDate: Date?
     public var longitude: Double
     public var latitude: Double
    
    public init(date: Date,
         id: String,
         title: String,
         subtitle: String? = nil,
         completedDate: Date? = nil,
         longitude: Double,
         latitude: Double) {
        self.date = date
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.completedDate = completedDate
        self.longitude = longitude
        self.latitude = latitude
    }
    
    public init?(mo: LocationNotificationMO) {
        guard
            let date = mo.date,
            let id = mo.identifier,
            let title = mo.title
        else { return nil }
        self.date = date
        self.id = id
        self.title = title
        self.subtitle = mo.subtitle
        self.completedDate = mo.completedDate
        self.longitude = mo.longitude
        self.latitude = mo.latitude
    }
}
