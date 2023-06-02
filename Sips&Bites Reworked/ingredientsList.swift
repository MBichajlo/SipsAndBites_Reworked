//
//  ingredientsList.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 25/05/2023.
//

import SwiftUI

struct ingredientsList: View {
    @Environment(\.managedObjectContext) var moc
    
    @State var ingrAlertShowing=false
    @State var newIngredientAlert = false
    @Binding var dropDown:Bool
    @ObservedObject var viewModel:newCourseModel
    @State var ingredientFilter=""
    @State var isSearching=false
    @FetchRequest(sortDescriptors: []) var list:FetchedResults<Ingredient>
    
    
    var body: some View {
        
        
        VStack(spacing:0) {
                    VStack {
                        HStack(){
                            
                            
                            Text("Składniki:")
                                .padding(.leading,20)
                            Spacer()
                            Button {
                                ingrAlertShowing.toggle()
                            } label: {
                                Image(systemName: "plus.square")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.green)
                            }
                            
                            
                            //MARK: - Ingredients sheet
                            .sheet(isPresented: $ingrAlertShowing){
                                VStack{
                                    HStack{
                                        Image(systemName: "magnifyingglass")
                                        TextField("Wyszukaj składnik", text: $ingredientFilter)
                                            .textInputAutocapitalization(.never)
                                            .onTapGesture {
                                                isSearching.toggle()
                                            }
                                            .onChange(of: ingredientFilter, perform: {_ in
                                                list.nsPredicate=NSPredicate(format: "%K BEGINSWITH[cd] %@",#keyPath(Ingredient.name), ingredientFilter.lowercased())
                                            })
                                        if isSearching{
                                            Button("Cancel", action: {
                                                isSearching.toggle()
                                                ingredientFilter=""
                                                ingrAlertShowing.toggle()
                                            })
                                        }
                                        
                                    }
                                    .frame(width:340,height: 40)
                                    .padding(.top,30)
                                    
                                    
                                    List{
                                        ForEach(list,id: \.id){i in
                                            Text(i.name )
                                        }
                                        
                                    }.frame(maxWidth: .infinity,maxHeight: (list.count>20) ?700: CGFloat(list.count*40))
                                        .listStyle(PlainListStyle())
                                        .ignoresSafeArea(edges: .all)
                                    
                                    if (list.count<4){
                                        Button {
                                            newIngredientAlert.toggle()
                                        } label: {
                                            Text("Dodaj składnik")
                                        }.alert("Wpisz nowy składnik", isPresented: $newIngredientAlert){
                                            
                                            VStack {
                                                TextField("AAAA", text: $viewModel.newIngredientName)
                                            }
                                                

                                            

                                        }

                                    }
                                    Spacer()
                                        
                                }
                                
                                .presentationDetents([.medium,.large,.fraction(0.2)])
                                
                            }
                            
                            
                            
                            
                            
                            Button(action:{
                                dropDown.toggle()
                            },label: {
                                Image(systemName:"chevron.down")
                                    .rotationEffect(.degrees(dropDown ? -180:0))
                                    .foregroundColor(.black)
                            })
                            .padding(.trailing,20)
                            
                            
                        }.padding(.top,10)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                dropDown.toggle()
                            }
                            .frame(width: 360,height: 35)
                        if dropDown{
                            VStack(spacing:0){
                                Divider()
                                    .overlay(.gray)
                                List(){
                                    ForEach(viewModel.ingrList,id:\.id){ingr in
                                        HStack{
                                            Button(ingr.name){
                                                Task{@MainActor in
                                                    //viewModel//.ingrRemove(ingr)
                                                    viewModel.ingrDelete(ingr)
                                                }
                                                
                                                print(ingr.id)
                                            }
                                        }
                                    }
                                }.listStyle(.plain)
                                    .ignoresSafeArea()
                                    .border(.gray)
                                Spacer()
                                

                                Spacer()
                            }
                            //.onAppear(perform: {viewModel.fetchAllIngredients()})
                            
                        }
                        
                        Spacer()
                    }.frame(width: 360,height: dropDown ? 200:40)
                .background{
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(.gray,lineWidth: 1.0)
                        
                }
                
                    
                    
                    
                
        }.animation(.spring(),value: dropDown)
    }
        
}



/*if dropDown{
    VStack{
        Rectangle()
            .stroke(.gray,lineWidth: 1.0)
            .frame(width: 360,height: 150)
    }
    .offset(y:dropDown ? 0:-150)
    
    
    
}*/


/*struct ingrDropDown:View{
    
    @Binding var dropDown:Bool
    
    
    var body: some View{
        
            ZStack(){
                Color(.cyan)
                    .frame(width: 345,height: 150)
                    .offset(y: dropDown ? 0:-150)
                    .animation(.default, value: dropDown)
                    
            }
        
            
            
            
        
    }
}*/





struct ingredientsList_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ingredientsList(dropDown: .constant(true),viewModel: newCourseModel())
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            ingredientsList(dropDown: .constant(false),viewModel: newCourseModel())
        }
        
    }
}
