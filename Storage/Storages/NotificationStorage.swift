//
//  NotificationStorage.swift
//  Storage
//
//  Created by admin on 7.02.24.
//

import Foundation
import CoreData

public class NotificationStorage<DTO: DTODescription> {
    
    public init() {}

    private func fetchMO(
        predicate: NSPredicate? = nil,
        sortDescriptors: [NSSortDescriptor] = []
    ) -> [DTO.MO] {

        let request = NSFetchRequest<DTO.MO>(entityName: "\(DTO.MO.self)")
        let context = CoreDataService.shared.context
        let results = try? context.fetch(request)
        return results ?? []
    }

    public func fetch(predicate: NSPredicate? = nil,
                      sortDescriptors: [NSSortDescriptor] = []) -> [DTO] {
        return fetchMO(predicate: predicate, sortDescriptors: sortDescriptors)
            .compactMap { DTO(mo: $0) }
    }
}



