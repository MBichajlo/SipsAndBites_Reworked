//
//  Recipe+CoreDataProperties.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 23/05/2023.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var cost: Int64
    @NSManaged public var id: UUID
    @NSManaged public var introduction: String?
    @NSManaged public var name: String
    @NSManaged public var preparation: String?
    @NSManaged public var profile: String?
    @NSManaged public var score: Int64
    @NSManaged public var time: Int64
    @NSManaged public var author: User?
    @NSManaged public var favourites: NSSet?

}

// MARK: Generated accessors for favourites
extension Recipe {

    @objc(addFavouritesObject:)
    @NSManaged public func addToFavourites(_ value: User)

    @objc(removeFavouritesObject:)
    @NSManaged public func removeFromFavourites(_ value: User)

    @objc(addFavourites:)
    @NSManaged public func addToFavourites(_ values: NSSet)

    @objc(removeFavourites:)
    @NSManaged public func removeFromFavourites(_ values: NSSet)

}

extension Recipe : Identifiable {

}
