//
//  Ingredient+CoreDataProperties.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 23/05/2023.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var cocktail: NSSet?
    @NSManaged public var course: NSSet?

}

// MARK: Generated accessors for cocktail
extension Ingredient {

    @objc(addCocktailObject:)
    @NSManaged public func addToCocktail(_ value: Cocktail)

    @objc(removeCocktailObject:)
    @NSManaged public func removeFromCocktail(_ value: Cocktail)

    @objc(addCocktail:)
    @NSManaged public func addToCocktail(_ values: NSSet)

    @objc(removeCocktail:)
    @NSManaged public func removeFromCocktail(_ values: NSSet)

}

// MARK: Generated accessors for course
extension Ingredient {

    @objc(addCourseObject:)
    @NSManaged public func addToCourse(_ value: Course)

    @objc(removeCourseObject:)
    @NSManaged public func removeFromCourse(_ value: Course)

    @objc(addCourse:)
    @NSManaged public func addToCourse(_ values: NSSet)

    @objc(removeCourse:)
    @NSManaged public func removeFromCourse(_ values: NSSet)

}

extension Ingredient : Identifiable {

}
