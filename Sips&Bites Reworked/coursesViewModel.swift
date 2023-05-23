//
//  coursesViewModel.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 23/05/2023.
//

import SwiftUI
import CoreData



@MainActor class coursesViewModel: ObservableObject{
    
    private let context=PersistenceController.shared.container.viewContext
    @Published var courses:[Course]=[]
    
    init() {
        fetchCourses()
    }
    
    func fetchCourses(){
        let request=NSFetchRequest<Course>(entityName: "Course")
        
        do{
            courses = try context.fetch(request)
        }catch{
            print("Courses fetch error")
        }
    }
    
    func addCourse(){
        let newCourse=Course(context: context)
        newCourse.name="a"
        newCourse.id=UUID()
        save()
        
    }
    
    func deleteCourse(_ course: Course){
        context.delete(course)
        
        save()
    }
    
    func save(){
        do{
            try self.context.save()
        }
        catch{
            print("Course save error")
        }
    }
}
