//
//  Employee+CoreDataProperties.swift
//  OneToManyCoreData2
//
//  Created by 薗部拓人 on 2022/05/21.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var employeeToDepartment: Department?

}

extension Employee : Identifiable {

}
