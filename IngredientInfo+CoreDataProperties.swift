//
//  IngredientInfo+CoreDataProperties.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 01/06/2023.
//
//

import Foundation
import CoreData


extension IngredientInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngredientInfo> {
        return NSFetchRequest<IngredientInfo>(entityName: "IngredientInfo")
    }

    @NSManaged public var amount: String?
    @NSManaged public var ingredient: Ingredient?
    @NSManaged public var course: NSSet?
    @NSManaged public var cocktail: NSSet?

}

// MARK: Generated accessors for course
extension IngredientInfo {

    @objc(addCourseObject:)
    @NSManaged public func addToCourse(_ value: Course)

    @objc(removeCourseObject:)
    @NSManaged public func removeFromCourse(_ value: Course)

    @objc(addCourse:)
    @NSManaged public func addToCourse(_ values: NSSet)

    @objc(removeCourse:)
    @NSManaged public func removeFromCourse(_ values: NSSet)

}

// MARK: Generated accessors for cocktail
extension IngredientInfo {

    @objc(addCocktailObject:)
    @NSManaged public func addToCocktail(_ value: Cocktail)

    @objc(removeCocktailObject:)
    @NSManaged public func removeFromCocktail(_ value: Cocktail)

    @objc(addCocktail:)
    @NSManaged public func addToCocktail(_ values: NSSet)

    @objc(removeCocktail:)
    @NSManaged public func removeFromCocktail(_ values: NSSet)

}

extension IngredientInfo : Identifiable {

}
