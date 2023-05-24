//
//  daniaView.swift
//  Sips&Bites Reworked
//
//  Created by Maciej Bichajło on 28/04/2023.
//

import SwiftUI
import CoreData
func void(){
    
}

func genC()->Color{
    switch Int.random(in: 0..<3) {
    case 0:
        return .teal
    case 1:
        return .red
    case 2:
        return .blue
    default:
        return .black
    }
}


let bs=40.0

let n=40
struct coursesView: View {
    @ObservedObject var viewModel=coursesViewModel()
    
    
    
    
    var body: some View {
        GeometryReader {g in
            ZStack {
                Color(.white)
                VStack{
                    
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: newCourseView()){
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: bs,height: bs)
                                .foregroundColor(.black)
                        }
                        .padding(.trailing,30)
                        Image(systemName: "fork.knife")
                            .resizable()
                            .scaledToFit()
                            .frame(width: bs+30-10,height: bs+30)
                            
                        Button(action: void, label: {Image(systemName: "list.bullet.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: bs,height: bs)
                                .foregroundColor(.black)
                        })
                        .padding(.leading,30)
                        Spacer()
                    }
                    Spacer()
                    List(viewModel.courses,id: \.id){course in
                            Button {
                                print(course)
                                print("aa")
                                print(type(of: course))
                                
                                Task {@MainActor in
                                    viewModel.deleteCourse(course)
                                    viewModel.fetchCourses()
                                }
                                
                            } label: {
                                Text(course.name)
                            }
                            .onChange(of: course){_ in
                                viewModel.fetchCourses()
                            }

                                                    
                    }
                    .frame(maxWidth: .infinity,maxHeight: g.size.height*0.7)
                    .edgesIgnoringSafeArea(.all)
                    .listStyle(PlainListStyle())
                    
                    
                }
            }
        }
        .onAppear(perform: viewModel.fetchCourses)
    }
        
}
    
struct daniaView_Previews: PreviewProvider {
    static var previews: some View {
        coursesView()
            
    }
}
