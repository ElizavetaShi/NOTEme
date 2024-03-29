//
//  DateNotificationDTO.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 4.02.24.
//

import UIKit

public struct DateNotificationDTO: DTODescription {
    
    public typealias MO = DateNotificationMO
    
    public var date: Date
    public var id: String
    public var title: String
    public var subtitle: String?
    public var completedDate: Date?
    public var targetDate: Date
    
    public init(date: Date,
                id: String,
                title: String,
                subtitle: String? = nil,
                completedDate: Date? = nil,
                targetDate: Date) {
        self.date = date
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.completedDate = completedDate
        self.targetDate = targetDate
    }
    
//    public init?(mo: DateNotificationMO) {
//        guard
//            let id = mo.identifier,
//            let title = mo.title,
//            let date = mo.date,
//            let targetDate = mo.targetDate
//        else { return nil }
//        self.date = date
//        self.id = id
//        self.title = title
//        self.subtitle = mo.subtitle
//        self.completedDate = mo.completedDate
//        self.targetDate = targetDate
//    }
    
    public static func fromMO(_ mo: DateNotificationMO) -> DateNotificationDTO? {
        guard
            let id = mo.identifier,
            let title = mo.title,
            let date = mo.date,
            let targetDate = mo.targetDate
        else { return nil }
        
        return DateNotificationDTO(date: date, id: id, title: title, subtitle: mo.subtitle, completedDate: mo.completedDate, targetDate: targetDate)
    }
}
