//
//  ContentView.swift
//  Edutainment
//
//  Created by Student on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    
    struct Question {
            var question: String
            var answer: Int
        }
   
    @State private var message = ""
    @State private var questionIndex = 0
    @State private var question = ""
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var answer = 0
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var correct = ""
    @State private var showingScore = false
    @State private var finalAlert = false
    @State private var questionNumber = 0
    @State private var x = 1
    @State private var y = 1
    @State private var gameStarted = false
    @State private var questions = [Question]()
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.9, green: 0.15, blue: 0.24), location: 0.1),
                .init(color: Color(red: 0.1, green: 0.9, blue: 0.4), location: 0.65),
                .init(color: Color(red: 0.1, green: 0.1, blue: 0.94), location: 1.0)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            if gameStarted == true {
                VStack{
                    Text("What is \(randomX()) x \(randomY())")
                        .font(.largeTitle)
                        .foregroundStyle(.cyan)
                    // wordscramble style ansering system?
                    
                    Picker("Answer", selection: $answer){
                            ForEach(0..<145){
                                Text("\($0)")
                                
                            }
                        }
                    
                    Button {
                        check()
                    } label: {
                        Text("Next Question")
                            .font(.largeTitle)
                    }
                    
                    Text("You are on question \(questionIndex)")
                        .font(.largeTitle)
                }
                
            } else {
                
                VStack {
                    
                    Text("Edutainment")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.blue)
                    
                    Spacer()
                    
                    List{
                        Picker("", selection: $x) {
                            ForEach(0..<13) {
                                Text("Multiply from up to \($0)")
                            }
                        }
                        
                        
                        Picker("", selection: $y) {
                            ForEach(0..<13) {
                                Text("to up to \($0)")
                            }
                        }
                        
                        Picker("Number of questions", selection: $questionNumber) {
                            ForEach(1..<21) {
                                Text("you want to be asked \($0) questions")
                            }
                        }
                        
                    Button("Start Game!", action: startGame)
                        .foregroundStyle(.indigo)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 200)
                    .clipShape(.rect(cornerRadius: 20))
                }
            }
        }
    
    func randomX() -> Int {
            y = Int.random(in: 1...x)
            return y
        }
    
        func randomY() -> Int {
            x = Int.random(in: 0...y)
            return x
        }
        
        func startGame() {
            gameStarted = true
        }
         
        func nextQuestion() {
            if questionNumber == questionIndex{
               gameStarted = false
                questionIndex = 0
            } else {
            gameStarted = true
                questionIndex += 1
            }
        }
    
        func checkAnswer(){
            if answer == randomX() * randomY() {
            correct = "Correct"
            } else {
             correct = "Wrong"
            }
        }
    
    func check(){
        checkAnswer()
        if correct == "Correct" {
            nextQuestion()
            print("Correct")
        } else{
            print(correct)
            }
        }
    }

#Preview {
    ContentView()
}
