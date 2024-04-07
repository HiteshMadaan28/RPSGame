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
    @State private var score_user=0
    @State private var score_computer=0
    @State private var winAlert=false
    @State private var winner=""

    @State private var computed=""
   
    func re(){
        score_user=0
        score_computer=0
        random=0
        random2=0
    }
    
    
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
            score_computer = score_computer + 1
            
        }
        else if(selected=="Rock"&&elements[random]=="Scissors")
        {
            print("Win")
            score_user = score_user + 1
        }
        else if(selected=="Paper"&&elements[random]=="Scissors")
        {
            print("Loose")
            score_computer = score_computer + 1
        }
        else if(selected=="Paper"&&elements[random]=="Rock")
        {
            print("Win")
            score_user = score_user + 1
        }
        else if(selected=="Scissors"&&elements[random]=="Rock")
        {
            print("Loose")
            score_computer = score_computer + 1
        }
        else if(selected=="Scissors"&&elements[random]=="Paper")
        {
            print("Win")
            score_user = score_user + 1
        }
        else{
            print("Loose....")
        }
        
        if(score_user==3 || score_computer==3){
            if(score_user==3){
                winner="User"
            }
            if(score_computer==3){
                winner="Computer"
            }
            winAlert=true
        }
        
        
    }
    
    
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                LinearGradient(colors: [.yellow , .green], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack{
                    VStack{
                        
                        Text("Select Your Element")
                            .font(.largeTitle)
                            .bold()
                            
                        HStack{
                            ForEach(0..<3){n in
                                Button{
                                    
                                    select(n)
                                    
                                }label: {
                                    Image(elements[n])
                                        .resizable()
                                        .frame(width: 100,height: 100)
                                }
                            }
                        }
                        
                        
                        Text("Results").font(.title)
                        HStack{
                            Image(elements[random2])
                                .resizable()
                                .frame(width: 100,height: 100)
                            
                            Text("Vs")
                            
                            Image(elements[random])
                                .resizable()
                                .frame(width: 100,height: 100)
                            
                        }
                        
                        
                        
                    }
                    
                    
                    HStack{
                        Text("\(score_user)")
                        
                        Text("Vs")
                        
                        Text("\(score_computer)")
                    }
                    
                    
                    
                    
                }
                .frame(maxWidth: 350,maxHeight: 450)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                .alert("The Game is Finished",isPresented: $winAlert){
                    
                    Button("Restart",action: re)
                    
                }message:{
                    Text("Winner : \(winner)")
                    
                }
                Spacer()
                
            }
            
            .navigationTitle("Rock Paper Scissors")
            
        }
        
    }
}

#Preview {
    ContentView()
}
