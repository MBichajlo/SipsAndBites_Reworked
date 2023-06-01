//
//  Ingredient+CoreDataProperties.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 01/06/2023.
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
    @NSManaged public var ingredientInfo: NSSet?

}

// MARK: Generated accessors for ingredientInfo
extension Ingredient {

    @objc(addIngredientInfoObject:)
    @NSManaged public func addToIngredientInfo(_ value: IngredientInfo)

    @objc(removeIngredientInfoObject:)
    @NSManaged public func removeFromIngredientInfo(_ value: IngredientInfo)

    @objc(addIngredientInfo:)
    @NSManaged public func addToIngredientInfo(_ values: NSSet)

    @objc(removeIngredientInfo:)
    @NSManaged public func removeFromIngredientInfo(_ values: NSSet)

}

extension Ingredient : Identifiable {

}
