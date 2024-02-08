//
//  DateNotificationStorage.swift
//  Storage
//
//  Created by Elizaveta Shidlovskaya on 4.02.24.
//

import CoreData

public final class DateNotificationStorage: NotificationStorage<DateNotificationDTO> {}

//public final class DateNotificationStorage {
//
//    typealias CompletionHandler = (Bool) -> Void
//
//    public init() {}
//
////    MARK: Fetch
//    public func fetch(predicate: NSPredicate? = nil,
//                      sortDescriptors: [NSSortDescriptor] = []) -> [DateNotificationDTO] {
//        return fetchMO(predicate: predicate, sortDescriptors: sortDescriptors)
//            .compactMap { DateNotificationDTO(mo: $0) }
//    }
//
//    private func fetchMO(
//        predicate: NSPredicate? = nil,
//        sortDescriptors: [NSSortDescriptor] = []
//    ) -> [DateNotificationMO] {
//
//        let request: NSFetchRequest<DateNotificationMO> = DateNotificationMO.fetchRequest()
//        let context = CoreDataService.shared.context
//        let results = try? context.fetch(request)
//        return results ?? []
//    }
//
////    MARK: Create is already with changes
//
//    public func create(dto: DateNotificationDTO,
//                completion: CompletionHandler? = nil) {
//        let context = CoreDataService.shared.backgroundContext
//        context.perform {
//            let mo = DateNotificationMO(context: context)
//            mo.apply(dto: dto)
//            CoreDataService.shared.saveContext(completion: completion)
//        }
//    }
//
////    MARK: Update
//    public func update(dto: DateNotificationDTO,
//                completion: CompletionHandler? = nil) {
//
//        let context = CoreDataService.shared.context
//        context.perform { [weak self] in
//            guard
//                let mo = self?.fetchMO(
//                    predicate: .Notification.notification(byId: dto.id)).first
//            else { return }
//            mo.apply(dto: dto)
//            CoreDataService.shared.saveContext(completion: completion)
//        }
//    }
//
//    public func updateOrCreate(dto: DateNotificationDTO,
//                        completion: CompletionHandler? = nil) {
//        if fetchMO(predicate: .Notification.notification(byId: dto.id)).isEmpty {
//            create(dto: dto, completion: completion)
//        } else {
//            update(dto: dto, completion: completion)
//        }
//    }
//}
