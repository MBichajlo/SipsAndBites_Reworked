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
    
    @Published var ingrList:[Ingredient]=[]
    @Published var newname:String=""
    
    
    
    func addToIngredients(ingr:Ingredient){
        ingrList.append(ingr)
    }
    
    
    
   
    
     
   /* func addParameters(
        
        time:Int64=0,
        cost:Int64=0,
        introduction:String="",
        preparation:String="",
        profile:String=""
    ){
        newCourse.name=self.name
        newCourse.time=time
        newCourse.cost=cost
        newCourse.introduction=introduction
        newCourse.preparation=preparation
        newCourse.profile=profile
    }
    */
    func saveCourse(){
        let newCourse=Course(context: context)
        newCourse.id=UUID()
        newCourse.name=self.newname
        do{
            try self.context.save()
        }catch{
            print("aa")
        }
    }
}
