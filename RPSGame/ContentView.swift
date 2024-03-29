//
//  ContentView.swift
//  RPSGame
//
//  Created by Hitesh Madaan on 26/03/24.
//

import SwiftUI

struct ContentView: View {
    
    var elements=["Rock","Paper","Scissor"]
    @State private var selected="Rock"
    
    func tap(_ e:String){
        
        selected=e
        
    }
    
    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                VStack{
                    
                    Text("Select Your Element")
                    
                    
                    Picker("Select the Elemets",selection: $selected){
                        ForEach(elements,id: \.self){ e in
                            //                        Button{
                            //                            tap(e)
                            //
                            //                        }label: {
                            //                            Text(e)
                            //                        }
                            Text(e)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(40)
                    
                    
                    Spacer()
                }
                Spacer()
                Button("Click"){
                    
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 400)
            
            .navigationTitle("Rock Paper Scissors")
            
        }
        
    }
}

#Preview {
    ContentView()
}
