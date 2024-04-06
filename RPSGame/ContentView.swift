//
//  ContentView.swift
//  RPSGame
//
//  Created by Hitesh Madaan on 26/03/24.
//

import SwiftUI

struct ContentView: View {
    
    var elements=["Rock","Paper","Scissors"]
    @State private var selected=""
    @State private var random=1
    @State private var random2=1

    @State private var computed=""
   
    
    func tap(_ e:String){
        
        selected=e
        
    }
    
    func select(_ n:Int){
        random2=n
        check()
    }
    func check(){
        
        random=Int.random(in: 0..<3)
        computed=elements[random]
        selected=elements[random2]
        
        if(selected==elements[random]){
            print("Tie \(selected)-\(elements[random])")
        }
        else if(selected=="Rock"&&elements[random]=="Paper")
        {
            print("Loose")
        }
        else if(selected=="Rock"&&elements[random]=="Scissors")
        {
            print("Win")
        }
        else if(selected=="Paper"&&elements[random]=="Scissors")
        {
            print("Loose")
        }
        else if(selected=="Paper"&&elements[random]=="Rock")
        {
            print("Win")
        }
        else if(selected=="Scissors"&&elements[random]=="Rock")
        {
            print("Loose")
        }
        else if(selected=="Scissors"&&elements[random]=="Paper")
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
                        .font(.largeTitle)
                    
                    
//                    Picker("Select the Elemets",selection: $selected){
//                        ForEach(elements,id: \.self){ e in
//                            
//                            Text(e)
//                            
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                    .padding(40)
                    
                    HStack{
                        ForEach(0..<3){n in
                            Button{
                                
                               select(n)
                                
                            }label: {
                                Image(elements[n])
                                    .resizable()
                                    .frame(width: 100,height: 150)
                            }
                        }
                    }
                    .frame(maxWidth: 450,maxHeight: 450)
                    .padding(40)
                    
                    Spacer()
                    
                    Text("Results")
                    HStack{
                        Image(elements[random2])
                            .resizable()
                            .frame(width: 100,height: 100)
                        
                        Text("Vs")
                        
                        Image(elements[random])
                            .resizable()
                            .frame(width: 100,height: 100)
                        
                    }
//                    Picker("Computer element",selection: $computed){
//                        ForEach(elements,id: \.self){
//                            Text($0)
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                    .padding(40)
                    
                    
                    Spacer()
                }
                Spacer()
                
            }
            .frame(maxWidth: 350,maxHeight: 500)
            
            
            
            .navigationTitle("Rock Paper Scissors")
            
        }
        
    }
}

#Preview {
    ContentView()
}
