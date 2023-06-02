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
    @Published var newIngredientAlert=false
    @Published var addingIngredientAlert=false
    @Published var wrongNameAlert=false
    @Published var amount=""
    
   
    
    
    @Published var ingrList:[Ingredient]=[]
    @Published var newname:String=""
    @Published var ingredients:[IngredientInfo]=[]
    
    @Published var newIngredientName:String = ""
    
    
    
    func newIngredient(){
        
        fetchAllIngredients()
        if allIngrList.contains(where: {$0.name.lowercased()==newIngredientName.lowercased()}){
            wrongNameAlert.toggle()
        }else{
            let newIngr=Ingredient(context: context)
            newIngr.name=newIngredientName
            newIngr.id=UUID()
            print(newIngr.id)
            save()
        }
        
    }
    
    func changeAmount(_ i:IngredientInfo){
        
        i.amount=amount
        amount=""
    }
    
    func addToIngredients(_ ingredient:Ingredient){
        ingrList.append(ingredient)
        let newIngredient = IngredientInfo(context: context)
        newIngredient.ingredient=ingredient
        save()
        ingredients.append(newIngredient)
       
    }
    
    func ingrRemove(_ i:IngredientInfo){
        ingrList.removeAll(where: {$0.id==i.ingredient!.id})
        ingredients.removeAll(where: {$0.ingredient! == i.ingredient!})
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
