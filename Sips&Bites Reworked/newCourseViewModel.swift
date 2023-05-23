//
//  newCourseViewModel.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 23/05/2023.
//

import SwiftUI
import CoreData

class newCourseModel:ObservableObject{
    private let context=PersistenceController.shared.container.viewContext
    @Published var newCourse:Course=Course()
    @Published var ingrList:[Ingredient]=[]
    
    
    
    func addToIngredients(ingr:Ingredient){
        ingrList.append(ingr)
    }
    
     
    func addParameters(
        name:String,
        time:Int64=0,
        cost:Int64=0,
        introduction:String="",
        preparation:String="",
        profile:String=""
    ){
        newCourse.name=name
        newCourse.time=time
        newCourse.cost=cost
        newCourse.introduction=introduction
        newCourse.preparation=preparation
        newCourse.profile=profile
    }
}
