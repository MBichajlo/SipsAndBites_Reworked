//
//  startingView.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 28/04/2023.
//

import SwiftUI

struct startingView: View {
    var body: some View {
        NavigationView(){
            VStack{
                Spacer()
                Text("Sips&Bites")
                    .font(.system(size: 40))
                    .bold(true)
                    .shadow(color:.black.opacity(0.2) ,radius: 1,x: 2,y:4)
                Spacer()
                NavigationLink(destination:menuView()){
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 35,height: 30,alignment: .center)
                        .foregroundColor(.black)
                }
                .padding(.bottom,90)
                
                
            }
        }
    }
}

struct startingView_Previews: PreviewProvider {
    static var previews: some View {
        startingView()
    }
}
