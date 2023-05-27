//
//  newCourseViewModel.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 23/05/2023.
//

import SwiftUI
import CoreData

@MainActor class newCourseModel:ObservableObject{

    private let context=PersistenceController.shared.container.viewContext
    
    @Published var allIngrList:[Ingredient]=[]
    
    
    @Published var ingrList:[Ingredient]=[]
    @Published var newname:String=""
    
    
    
    
    
    func newIngredient()->Ingredient{
        let newIngr=Ingredient(context: context)
        newIngr.name="aaa"
        newIngr.id=UUID()
        print(newIngr.id)
        save()
        return newIngr
    }
    
    func addToIngredients(){
        
        ingrList.append(newIngredient())
    }
    
    func ingrRemove(_ i:Ingredient){
        ingrList.removeAll(where: {$0.id==i.id})
        print(ingrList)
    }
    
    func ingrDelete(_ i:Ingredient){
        
        context.delete(i)
        save()
    }
    
    
    func test(){
        print("a")
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
    
    func fetchAllIngredients(_ filter:String=""){
        let request = NSFetchRequest<Ingredient>(entityName: "Ingredient")
        
        request.predicate=NSPredicate(format: "name CONTAINS %@", filter)
        do{
            try allIngrList=context.fetch(request)
        }catch{
            print("fetch error ")
        }
    }
    
    func saveCourse(){
        let newCourse=Course(context: context)
        newCourse.id=UUID()
        newCourse.name=self.newname
        save()
    }
    
    func save(){
        do{
            try self.context.save()
        }catch{
            print("new course save err")
        }
    }
}
