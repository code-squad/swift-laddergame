//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// Swift-LadderGame

// 메인 함수
func main() -> Bool {
    let participants = InputView().getParticipant()
    if !InputCheck().isValid(people: participants) {return false}
    let height = InputView().getHeight()
    if !InputCheck().isValid(height: height) {return false}

    let list = InputView().fillPlayersWith(participants)
    let leg = LadderStep(step: [true, false])
    
    let ladder = LadderGame(height: height, names: list, step: leg.step).makeLadderWith()
    
    ResultView(ladder: ladder, players: list).printOut()
    return true
}

while (true) {
    if !main() {break}
}
