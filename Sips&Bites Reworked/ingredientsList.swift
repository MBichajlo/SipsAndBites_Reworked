//
//  ingredientsList.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 25/05/2023.
//

import SwiftUI

struct ingredientsList: View {
    @Binding var dropDown:Bool
    
    
    var body: some View {
        
        
        VStack(spacing:0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke(.gray,lineWidth: 1.0)
                        HStack{
                            
                            Text("Składniki:")
                                .padding(.leading,20)
                            Spacer()
                            Button(action:{
                                dropDown.toggle()
                            },label: {
                                Image(systemName:"chevron.down")
                                    .rotationEffect(.degrees(dropDown ? 180:0))
                                    .foregroundColor(.black)
                            })
                            .padding(.trailing,20)
                            
                            
                        }.padding(.bottom,0)
                    }.frame(width: 360,height: 35)
                if dropDown{
                    VStack{
                        Rectangle()
                            .stroke(.gray,lineWidth: 1.0)
                            .frame(width: 360,height: 150)
                    }
                    .offset(y:dropDown ? 0:-150)
                    
                    
                    
                }
                    
                    
                    
            
        }.animation(.spring(),value: dropDown)
    }
        
    }


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
        EmptyView()
        
    }
}
