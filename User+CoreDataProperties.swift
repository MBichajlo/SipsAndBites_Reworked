//
//  User+CoreDataProperties.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 01/06/2023.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var surname: String?
    @NSManaged public var author: NSSet?
    @NSManaged public var favourites: NSSet?

}

// MARK: Generated accessors for author
extension User {

    @objc(addAuthorObject:)
    @NSManaged public func addToAuthor(_ value: Recipe)

    @objc(removeAuthorObject:)
    @NSManaged public func removeFromAuthor(_ value: Recipe)

    @objc(addAuthor:)
    @NSManaged public func addToAuthor(_ values: NSSet)

    @objc(removeAuthor:)
    @NSManaged public func removeFromAuthor(_ values: NSSet)

}

// MARK: Generated accessors for favourites
extension User {

    @objc(addFavouritesObject:)
    @NSManaged public func addToFavourites(_ value: Recipe)

    @objc(removeFavouritesObject:)
    @NSManaged public func removeFromFavourites(_ value: Recipe)

    @objc(addFavourites:)
    @NSManaged public func addToFavourites(_ values: NSSet)

    @objc(removeFavourites:)
    @NSManaged public func removeFromFavourites(_ values: NSSet)

}

extension User : Identifiable {

}
