//
//  LocationNotificationStorage.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 5.02.24.
//

import CoreData

public final class LocationNotificationStorage: NotificationStorage<LocationNotificationDTO> {}

//public final class LocationNotificationStorage {
//
//    public init() {}
//
//    typealias CompletionHandler = (Bool) -> Void
//
////    MARK: Fetch
//
//    public func fetch(predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor] = []) -> [LocationNotificationDTO] {
//        return fetchMO(predicate: predicate, sortDescriptors: sortDescriptors).compactMap { LocationNotificationDTO(mo: $0)
//        }
//    }
//
//    private func fetchMO(predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor] = []) -> [LocationNotificationMO] {
//
//        let request: NSFetchRequest<LocationNotificationMO> = LocationNotificationMO.fetchRequest()
//        let context = CoreDataService.shared.context
//        let results = try? context.fetch(request)
//        return results ?? []
//    }
//
////    MARK: Create
//
//    func create(dto: LocationNotificationDTO, completion: CompletionHandler? = nil) {
//        let context = CoreDataService.shared.context
//        context.perform {
//            let mo = LocationNotificationMO(context: context)
//            mo.apply(dto: dto)
//            CoreDataService.shared.saveContext(completion: completion)
//        }
//    }
//
////    MARK: Update
//
//    func update(dto: LocationNotificationDTO, completion: CompletionHandler? = nil) {
//
//        let context = CoreDataService.shared.context
//        context.perform { [weak self] in
//            guard let mo = self?.fetchMO(predicate: .Notification.notification(byId: dto.id)).first
//            else { return }
//            mo.apply(dto: dto)
//            CoreDataService.shared.saveContext(completion: completion)
//        }
//    }
//
//    func updateOrCreate(dto: LocationNotificationDTO, completion: CompletionHandler? = nil) {
//        if fetchMO(predicate: .Notification.notification(byId: dto.id)).isEmpty {
//            create(dto: dto, completion: completion)
//        } else {
//            update(dto: dto, completion: completion)
//        }
//    }
//}
