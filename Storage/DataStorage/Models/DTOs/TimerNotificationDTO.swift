//
//  TimerNotificationDTO.swift
//  Storage
//
//  Created by admin on 8.02.24.
//

import UIKit

public struct TimerNotificationDTO: DTODescription {
    
    public typealias MO = TimerNotificationMO
    
    public var date: Date
    public var id: String
    public var title: String
    public var subtitle: String?
    public var completedDate: Date?
    public var targetDate: Date
    
    public var timeLeft: TimeInterval {
        targetDate.timeIntervalSince1970 - date.timeIntervalSince1970
    }
    
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
    
    
    public static func fromMO(_ mo: TimerNotificationMO) -> TimerNotificationDTO? {
        guard
            let id = mo.identifier,
            let date = mo.date,
            let title = mo.title,
            let targetDate = mo.targetDate
        else { return nil }
        
        return TimerNotificationDTO(date: date,
                                    id: id,
                                    title: title,
                                    subtitle: mo.subtitle,
                                    completedDate: mo.completedDate,
                                    targetDate: targetDate)
    }
}
