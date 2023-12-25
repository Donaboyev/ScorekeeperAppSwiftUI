//
//  ContentView.swift
//  ScorekeeperAppSwiftUI
//
//  Created by Abbos Donaboev on 25/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var score1 = 0
    @State var score2 = 0
    @State var foul1: Int = 0
    @State var foul2: Int = 0
    
    var body: some View {
        ZStack {
            VStack() {
                HStack(spacing: 60) {
                    TeamScore(title: "Team 1",score: score1) {score in
                            score1+=score
                    }
                    TeamScore(title: "Team 1",score: score2) {score in
                        score2+=score
                }
                }
                Spacer()
                HStack {
                    Button(action: {
                        foul1+=1
                    }, label: {
                        Text("+1")
                    }).buttonStyle(.bordered)
                    Spacer()
                    Text("\(foul1)").foregroundColor(Color("FoulTextColor")).font(.title2)
                    Spacer()
                    Text("Fouls").foregroundColor(.white).font(.title)
                    Spacer()
                    Text("\(foul2)").foregroundColor(Color("FoulTextColor")).font(.title2)
                    Spacer()
                    Button(action: {
                        foul2+=1
                    }, label: {
                        Text("+1")
                    }).buttonStyle(.bordered)
                }.padding()
                Spacer()
                Spacer()
                Button(action: {
                    foul1=0
                    foul2=0
                    score1=0
                    score2=0
                }, label: {
                    Text("Reset")
                }).buttonStyle(.bordered).padding()
            }
        }.background(.black)
        
    }
}

struct TeamScore: View {
    let title: String
    let score: Int
    var addScore: (Int) -> ()
    
    var body: some View {
        VStack {
            Text(title).foregroundColor(.white).font(.title)
            Text("\(score)").foregroundColor(Color("ScoreTextColor")).font(.largeTitle).padding(.vertical, 16)
            Button(action: {
                addScore(1)
            }, label: {
                Text("+1")
            }).buttonStyle(.bordered)
            Button(action: {
                addScore(2)
            }, label: {
                Text("+2")
            }).buttonStyle(.bordered).padding()
            Button(action: {
                addScore(3)
            }, label: {
                Text("+3")
            }).buttonStyle(.bordered)
        }
    }
    
}

#Preview {
    ContentView()
}
