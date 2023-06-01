//
//  ingredientsEditor.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 28/05/2023.
//

import SwiftUI
import CoreData
struct ingredientsEditor: View {
    
    
    
    
    @Binding var viewVis:Bool
    @State var dragOffset=CGSize.zero
    @ObservedObject var viewModel:newCourseModel
    @FetchRequest(sortDescriptors: [],animation: .none) var list:FetchedResults<Ingredient>
    @State var isSearching = false
    //@State var shake = false
    @State var ingredientFilter:String=""
    
    
 
    
    
    let screensize=UIScreen.main.bounds.size.width
    var barWidth=UIScreen.main.bounds.size.width*0.7
    
    var body: some View {
        HStack(alignment: .top){
            ZStack(alignment: .top){
                Color(red: 250, green: 249, blue: 246)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack{
                        Text("Dodane Składniki:")
                        Divider()
                            .overlay(.gray)
                            
                        ForEach(viewModel.ingrList,id:\.id){ingr in
                            Text(ingr.name)
                        }
                        
                        Divider()
                        Text("Wszystkie składniki:")
                        HStack{
                            Image(systemName: "magnifyingglass")
                            TextField("Wyszukaj składnik", text: $ingredientFilter)
                                
                                .textInputAutocapitalization(.never)
                                
                                .onChange(of: ingredientFilter, perform: {_ in
                                    if ingredientFilter.isEmpty{
                                        list.nsPredicate=NSPredicate(format: "not (SELF IN %@)", viewModel.ingrList)
                                    }else{
                                        
                                        list.nsPredicate=NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "%K BEGINSWITH[cd] %@",#keyPath(Ingredient.name), ingredientFilter.lowercased()),NSPredicate(format: "not (SELF IN %@)", viewModel.ingrList)])
                                        isSearching=true
                                    }
                                })
                            if isSearching{
                                Button("Cancel", action: {
                                    isSearching.toggle()
                                    ingredientFilter=""
                                    
                                    
                                })
                            }
                            
                        }.padding(10)
                        
                            
                        ForEach(list,id: \.id){i in
                            Button {
                                viewModel.addToIngredients(i)
                                
                                
                            } label: {
                                Text(i.name)
                            }.buttonStyle(.plain)
                                .frame(maxWidth: .infinity)
                                .background{
                                    
                                }
                                .padding(4)

                        }.onChange(of: viewModel.ingrList, perform: {_ in
                            list.nsPredicate=NSPredicate(format: "not (SELF IN %@)", viewModel.ingrList)
                                
                        })
                        
                        
                        if (list.count<4){
                            Button {
                                viewModel.newIngredientAlert.toggle()
                                isSearching.toggle()
                                //list.nsPredicate = nil
                                
                                ingredientFilter=""
                                
                                
                            } label: {
                                Text("Dodaj składnik")
                            }
                            
                            
                        }
                        
                        
                    }
                }

            }
            .frame(width: screensize*0.7,alignment: .trailing)
            .overlay(alignment: .leading){
                Rectangle().frame(width: 1, height: nil, alignment: .leading).foregroundColor(Color.gray)
                    .ignoresSafeArea()
            }
            
            .offset(x:viewVis ? screensize-barWidth  :screensize )
            .animation(.default, value: viewVis)
            .onChange(of: viewVis, perform: {_ in
                list.nsPredicate=NSPredicate(format: "not (SELF IN %@)", viewModel.ingrList)
            })
            Spacer()
        }
        
        
        .onTapGesture {
            //viewVis.toggle()
            
        }.alert("Dodaj nowy składnik", isPresented: $viewModel.newIngredientAlert, actions: {
            TextField("Nazwa", text: $viewModel.newIngredientName)
                .textInputAutocapitalization(.never)
            Button(role: .none) {
                viewModel.newIngredient()
                viewModel.newIngredientName = ""
            } label: {
                Text("Akceptuj")
            }
            Button(role: .cancel) {
                
            } label: {
                Text("Anuluj")
            }

            
                
        })
        .alert("Ten składnik już istnieje", isPresented: $viewModel.wrongNameAlert,actions: {
            
        })
        .alert("Podaj ilość:", isPresented: $viewModel.addingIngredientAlert) {
            TextField("....", text: $viewModel.amount)
                .textInputAutocapitalization(.never)
            Button {
                
            } label: {
                Text("Akceptuj")
            }
            Button(role: .cancel) {
                
            } label: {
                Text("Anuluj")
            }


        }
        
    }
    
}

struct ingredientsEditor_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ingredientsEditor(viewVis: .constant(true), viewModel: newCourseModel())
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            newCourseView()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
            
    }
}
