//
//  menuView.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 28/04/2023.
//

import SwiftUI

let size = 65.0
let bH=75.0

struct menuView: View {
    var body: some View {
        VStack(spacing: 25){
            Spacer()
            HStack(spacing: 0){
                Image(systemName: "wineglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size-10,height: size)
                Image(systemName: "fork.knife")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size-10,height: size)
            
            }
            Spacer(minLength: 100)
            NavigationLink(destination: daniaView()){
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black,lineWidth: 2)
                    .frame(width: 280,height: bH)
                    .background(){
                        Text("Dania")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .bold()
                    }
            }
            .frame(width: 280,height: bH)
            NavigationLink(destination: cocktaileView()){
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black,lineWidth: 2)
                    .frame(width: 280,height: bH)
                    .background(){
                        Text("Cocktaile")
                            .font(.system(size: 20))
                            .foregroundColor(.black).bold()
                    }
            }
            .frame(width: 280,height: bH)
            NavigationLink(destination: userView()){
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black,lineWidth: 2)
                    .frame(width: 280,height: bH)
                    .background(){
                        Text("Użytkownik")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .bold()
                    }
            }
            .frame(width: 280,height: bH)
            Spacer()
            
        }
        
    }
        
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}
