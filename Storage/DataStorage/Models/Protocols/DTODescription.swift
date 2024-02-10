//
//  DTODescription.swift
//  Storage
//
//  Created by admin on 7.02.24.
//

import Foundation
import CoreData

public protocol DTODescription {
    associatedtype DTO
    associatedtype MO: MODescription
    
    var id: String { get }
    init?(mo: MO)
}

public protocol MODescription: NSManagedObject, NSFetchRequestResult {
    
    func apply<Type: DTODescription>(_ dto: Type)
}
