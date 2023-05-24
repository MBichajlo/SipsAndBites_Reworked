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
    
    var body: some View {
        GeometryReader {g in
            ScrollView(){
                VStack(alignment: .center){
                    TextField("Nowy przepis", text: $viewModel.newname)
                        .multilineTextAlignment(.center)
                        .textInputAutocapitalization(.never)
                        .font(.largeTitle)
                        //.background{Color(.cyan)}
                    Spacer()
                    Button(action: {
                        viewModel.saveCourse()
                        dismiss()
                    }){
                        Text("Save")
                            
                    }.padding(.top,600)
                        
                        
                }
            }
        }
    }
}

struct newCourseView_Previews: PreviewProvider {
    static var previews: some View {
        newCourseView()
    }
}
