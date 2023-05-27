//
//  newCourseView.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 24/05/2023.
//

import SwiftUI

struct newCourseView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel=newCourseModel()
    
    @State var ingrDropDown=false
    
    var body: some View {
            ScrollView(){
                VStack(alignment: .center){
                    TextField("Nowy przepis", text: $viewModel.newname)
                        .multilineTextAlignment(.center)
                        .textInputAutocapitalization(.never)
                        .font(.largeTitle)
                        //.background{Color(.cyan)}
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 150, height: 150)
                        .border(.cyan)
                        .padding(.top,30)
                    Spacer()
                    
                    ingredientsList(dropDown: $ingrDropDown,viewModel: viewModel)
                        
                    Spacer(minLength: 50)
                    Button(action: {
                        viewModel.saveCourse()
                        dismiss()
                    }){
                        Text("Save")
                            
                    }
                    
                        
                        
                }.animation(.spring(),value:  ingrDropDown)
            }
        
    }
}

struct newCourseView_Previews: PreviewProvider {
    static var previews: some View {
        newCourseView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            
    }
}
