//
//  ResultView.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    func showResult(_ ladderGame:LadderGame) {
        for _ in 0..<ladderGame.height {
            showLadder(numberOfPeople: ladderGame.names.count - 1)
        }
        showParticipant(ladderGame.names)
    }
    
    func showLadder(numberOfPeople:Int) {
        var randomStep = ""
        var previousStep = ""
        for _ in 0..<numberOfPeople {
            randomStep = makeDisconnectedStep(previousStep)
            print("|", terminator: "")
            print(randomStep, terminator: "")
            previousStep = randomStep
        }
        print("|")
    }
    
    func makeDisconnectedStep(_ previousStep:String) -> String{
        guard previousStep == "-----" else {
            return LadderStep().randomStep()
        }
        return "     "
    }
    
    func showParticipant(_ player:[LadderPlayer]) {
        for i in player {
            fitName(i.name)
        }
    }
    
    func fitName(_ name:String) {
        print(name, terminator:"")
        for _ in 0...5 - name.count {
            print(" ", terminator: "")
        }
    }
}
