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
    @State var editorVis=false
    
    @State var ingrDropDown=false
    
    var body: some View {
        ZStack {
            GeometryReader{_ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(editorVis ? 1:0)
            .animation(.easeIn, value: editorVis)
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
                        
                        //ingredientsList(dropDown: $ingrDropDown,viewModel: viewModel)
                            
                        Spacer(minLength: 50)
                        

                        Button(action: {
                            viewModel.saveCourse()
                            dismiss()
                        }){
                            Text("Save")
                                
                        }
                        
                            
                            
                    }.animation(.spring(),value:  ingrDropDown)
            }.offset(x: editorVis ? -UIScreen.main.bounds.width*0.7:0)
                
                .animation(.default, value: editorVis)
            ingredientsEditor(viewVis: $editorVis, viewModel: viewModel).opacity(100)
        }
        .gesture(
            DragGesture()
                .onEnded{dg in
                    if editorVis{
                        if dg.translation.width>(60){
                            editorVis.toggle()
                        }
                    }else{
                        if dg.translation.width<(-60){
                            editorVis.toggle()
                        }
                    }
                    
                }
        )
        .scrollDismissesKeyboard(.never)
    }
}

struct newCourseView_Previews: PreviewProvider {
    static var previews: some View {
        newCourseView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            
    }
}
