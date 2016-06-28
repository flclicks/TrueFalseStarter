//
//  DataModel.swift
//  TrueFalseStarter
//
//  Created by Kiran on 27/06/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

struct Questions {
    
    var arrayOfQuestions = [[String: String]]()
    
}

let questionSet: [[String: String]] =
[
    ["Question": "This was the only US President to serve more than two consecutive terms.",
     "1": "George Washington",
     "2": "Franklin D. Roosevelt",
     "3": "Woodrow Wilson",
     "4": "Andrew Jackson",
     "CorrectAns": "2"],
    
    ["Question": "Which of the following countries has the most residents?",
     "1": "Nigeria",
     "2": "Russia",
     "3": "Iran",
     "4": "Vietnam",
     "CorrectAns": "1"],
    
    ["Question": "In what year was the United Nations founded?",
     "1": "1918",
     "2": "1919",
     "3": "1945",
     "4": "1954",
     "CorrectAns": "3"],
    
    ["Question": "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
     "1": "Paris",
     "2": "Washington D.C.",
     "3": "New York City",
     "4": "Boston",
     "CorrectAns": "3"],

    ["Question": "Which nation produces the most oil?",
     "1": "Iran",
     "2": "Iraq",
     "3": "Brazil",
     "4": "Canada",
     "CorrectAns": "4"],

    ["Question": "Which country has most recently won consecutive World Cups in Soccer?",
     "1": "Italy",
     "2": "Brazil",
     "3": "Argetina",
     "4": "Spain",
     "CorrectAns": "2"],
    
    ["Question": "Which of the following rivers is longest?",
     "1": "Yangtze",
     "2": "Mississippi",
     "3": "Congo",
     "4": "Mekong",
     "CorrectAns": "2"],
    
    ["Question": "Which city is the oldest?",
     "1": "Mexico City",
     "2": "Cape Town",
     "3": "San Juan",
     "4": "Sydney",
     "CorrectAns": "1"],
    
    ["Question": "Which country was the first to allow women to vote in national elections?",
     "1": "Poland",
     "2": "United States",
     "3": "Sweden",
     "4": "Senegal",
     "CorrectAns": "1"],
    
    ["Question": "Which of these countries won the most medals in the 2012 Summer Games?",
     "1": "France",
     "2": "Germany",
     "3": "Japan",
     "4": "Great Britian",
     "CorrectAns": "4"]
    
]

var setOfQuestions = Questions(arrayOfQuestions: questionSet)

