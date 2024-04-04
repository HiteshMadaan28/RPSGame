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
    @State private var random=Int.random(in: 0..<3)
    
    
    
    
    func tap(_ e:String){
        
        selected=e
        
    }
    func check(){
        random=Int.random(in: 0..<3)
        
        if(selected==elements[random]){
            print("Tie \(selected)-\(elements[random])")
        }
        else if(selected=="Rock"&&elements[random]=="Paper")
        {
            print("Loose")
        }
        else if(selected=="Rock"&&elements[random]=="Scissor")
        {
            print("Win")
        }
        else if(selected=="Paper"&&elements[random]=="Scissor")
        {
            print("Loose")
        }
        else if(selected=="Paper"&&elements[random]=="Rock")
        {
            print("Win")
        }
        else if(selected=="Scissor"&&elements[random]=="Rock")
        {
            print("Loose")
        }
        else if(selected=="Scissor"&&elements[random]=="Paper")
        {
            print("Win")
        }
        else{
            print("Loose....")
        }
    }
    
    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                VStack{
                    
                    Text("Select Your Element")
                    
                    
                    Picker("Select the Elemets",selection: $selected){
                        ForEach(elements,id: \.self){ e in
                            
                            Text(e)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(40)
                    
                    Picker("Computer element",selection: $random){
                        ForEach(elements,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(40)
                    
                    
                    Spacer()
                }
                Spacer()
                Button("Click"){
                    check()
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
