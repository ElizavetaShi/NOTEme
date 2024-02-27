//
//  DTODescription.swift
//  Storage
//
//  Created by admin on 7.02.24.
//

import Foundation
import CoreData

//public protocol DTODescription {
//    associatedtype DTO
//    associatedtype MO: MODescription
//
//    var id: String { get }
//    init?(mo: MO)
//}
//
//public protocol MODescription: NSManagedObject, NSFetchRequestResult {
//
//    func apply<Type: DTODescription>(_ dto: Type)
//}

public protocol DTODescription {
    //С каким МО связано
    associatedtype MO: MODescription
    var id: String { get set }
    var date: Date { get set }
    var title: String { get set }
    var subtitle: String? { get set }
    var completedDate: Date? { get set }
    
    //Для маппинга из МО в конкртеный ДТО
    static func fromMO(_ mo: MO) -> Self?
}

public protocol MODescription: NSManagedObject, NSFetchRequestResult {
    func apply(dto: any DTODescription)
    func toDTO() -> (any DTODescription)?
}

//struct BaseDTO: DTODescription {
//    typealias MO = BaseMO
//    
//    static func fromMO(_ mo: BaseMO) -> BaseDTO {
//        return BaseDTO()
//    }
//}
//
//struct FirstDTO: DTODescription {
//    typealias MO = FirstMO
//    
//    var date: String
//    
//    static func fromMO(_ mo: FirstMO) -> FirstDTO {
//        return FirstDTO(date: mo.date)
//    }
//}
//
//struct SecondDTO: DTODescription {
//    typealias MO = SecondMO
//    
//    var location: String
//    
//    static func fromMO(_ mo: SecondMO) -> SecondDTO {
//        return SecondDTO(location: mo.location)
//    }
//}
//
//class BaseMO: MODescription {
//    func toDTO() -> any DTODescription {
//        return BaseDTO.fromMO(self)
//    }
//}
//
//class FirstMO: BaseMO {
//    var date = "date"
//    
//    override func toDTO() -> any DTODescription {
//        return FirstDTO.fromMO(self)
//    }
//}
//
//class SecondMO: BaseMO {
//    var location = "location"
//    
//    override func toDTO() -> any DTODescription {
//        return SecondDTO.fromMO(self)
//    }
//}
//
//class Storage<DTO: DTODescription> {
//    func printInfo() {
//        print(DTO.self, DTO.MO.self)
//    }
//}
//
//let firstStorage = Storage<FirstDTO>()
//let secondStorage = Storage<SecondDTO>()
//let baseStorage = Storage<BaseDTO>()
//
//firstStorage.printInfo()
//secondStorage.printInfo()
//baseStorage.printInfo()
//
//let first = FirstMO()
//let second = SecondMO()
//let base = BaseMO()
//
//let result = [first, first, first].map {
//    $0.toDTO()
//}.compactMap({ $0 as? FirstDTO })
//
//print(result)
//
//result.forEach { dtoDesc in
//    switch dtoDesc.self {
//    case is FirstDTO:
//        guard let dto = dtoDesc as? FirstDTO
//        else { return }
//        print(dto.date)
//    case is SecondDTO:
//        guard let dto = dtoDesc as? SecondDTO
//        else { return }
//        print(dto.location)
//    default: break
//    }
//}
