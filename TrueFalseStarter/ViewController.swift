//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 10
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion = Int()
    var secondIndex = Int()
    var previouslyAskedQuestions = [Int]()
    var gameSound: SystemSoundID = 0
    
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(setOfQuestions.arrayOfQuestions.count)


    
        for askedQuestion in previouslyAskedQuestions
        {
            
            if indexOfSelectedQuestion == askedQuestion {
               
                nextRound()

            
            }
            
            
        }
        previouslyAskedQuestions.append(indexOfSelectedQuestion)
        
        let questionDictionary = setOfQuestions.arrayOfQuestions[indexOfSelectedQuestion]
        
        questionField.text = questionDictionary["Question"]
        
        option1.setTitle(questionDictionary["1"], forState: UIControlState.Normal)
        option2.setTitle(questionDictionary["2"], forState: UIControlState.Normal)
        option3.setTitle(questionDictionary["3"], forState: UIControlState.Normal)
        option4.setTitle(questionDictionary["4"], forState: UIControlState.Normal)
        
        playAgainButton.hidden = true

        
        }
    
    
    
    
    func displayScore() {
        // Hide the answer buttons
        option1.hidden = true
        option2.hidden = true
        option3.hidden = true
        option4.hidden = true
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = setOfQuestions.arrayOfQuestions[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["CorrectAns"]
        
        if (sender === option1 &&  correctAnswer == "1") ||
            (sender === option2 && correctAnswer == "2") ||
            (sender === option3 && correctAnswer == "3") ||
            (sender === option4 && correctAnswer == "4")
        {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        

        if questionsAsked != questionsPerRound
        {
            
            // Continue game
            

            displayQuestion()
            

            
        } else         {
            
            // Game is over
            displayScore()

                   }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        option1.hidden = false
        option2.hidden = false
        option3.hidden = false
        option4.hidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
   }

