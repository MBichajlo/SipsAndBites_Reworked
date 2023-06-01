//
//  ingredientsEditor.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 28/05/2023.
//

import SwiftUI

struct ingredientsEditor: View {
    
    
    
    
    @Binding var viewVis:Bool
    @State var dragOffset=CGSize.zero
    @ObservedObject var viewModel:newCourseModel
    @FetchRequest(sortDescriptors: []) var list:FetchedResults<Ingredient>
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
                                //.onTapGesture {
                                    //isSearching.toggle()
                                    
                                    
                                //}
                                .onChange(of: ingredientFilter, perform: {_ in
                                    if ingredientFilter.isEmpty{
                                        list.nsPredicate=nil
                                    }else{
                                        list.nsPredicate=NSPredicate(format: "%K BEGINSWITH[cd] %@",#keyPath(Ingredient.name), ingredientFilter.lowercased())
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
                                viewModel.ingrDelete(i)
                            } label: {
                                Text(i.name)
                            }.buttonStyle(.plain)
                                .frame(maxWidth: .infinity)
                                .background{
                                    RoundedRectangle(cornerRadius: 9.0)
                                        .stroke(.gray,lineWidth: 1)
                                }
                                .padding(4)

                        }
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
