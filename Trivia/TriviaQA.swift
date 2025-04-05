//
//  TriviaQA.swift
//  Trivia
//
//  Created by Vanessa Ramirez on 3/14/25.
//


import Foundation

struct TriviaQA {
  let text: String
  let category: String
  let answers: [String]
  let correctAnswerIndex: Int
}

struct TriviaQAs {
    let questions: [TriviaQA]
    
    init() {
        // Mock Data
        questions = [
                    TriviaQA(text: "What is the name of the Weasley family's home?", category: "Locations", answers: ["The Burrow", "Grimmauld Place", "Hogwarts", "Godric's Hollow"], correctAnswerIndex: 0),
                     
                     TriviaQA(text: "Which Hogwarts house values intelligence and wit?", category: "Hogwarts Houses", answers: ["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"], correctAnswerIndex: 2),
                     
                     TriviaQA(text: "What magical object chooses the Hogwarts students' house?", category: "Magical Objects", answers: ["Elder Wand", "Sorting Hat", "Mirror of Erised", "Time-Turner"], correctAnswerIndex: 1),
                     
                     TriviaQA(text: "Who was the Half-Blood Prince?", category: "Characters", answers: ["Harry Potter", "Albus Dumbledore", "Severus Snape", "Tom Riddle"], correctAnswerIndex: 2),
                     
                     TriviaQA(text: "What spell is used to summon objects?", category: "Spells", answers: ["Alohomora", "Expelliarmus", "Accio", "Lumos"], correctAnswerIndex: 2),
        ]
    }
    }
