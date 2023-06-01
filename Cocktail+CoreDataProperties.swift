//
//  Cocktail+CoreDataProperties.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 01/06/2023.
//
//

import Foundation
import CoreData


extension Cocktail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cocktail> {
        return NSFetchRequest<Cocktail>(entityName: "Cocktail")
    }

    @NSManaged public var ingredients: NSSet?

}

// MARK: Generated accessors for ingredients
extension Cocktail {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: IngredientInfo)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: IngredientInfo)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}
