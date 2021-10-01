//
//  Fabric+CoreDataProperties.swift
//  SewHappy
//
//  Created by Cassy on 10/1/21.
//
//

import Foundation
import CoreData


extension Fabric {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Fabric> {
        return NSFetchRequest<Fabric>(entityName: "Fabric")
    }

    @NSManaged public var color: String?
    @NSManaged public var fiberType: String?
    @NSManaged public var image: Data
    @NSManaged public var name: String
    @NSManaged public var purchasedFrom: String?
    @NSManaged public var quantity: Double

}

extension Fabric : Identifiable {

}
