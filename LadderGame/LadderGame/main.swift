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
func main() {
    let participants = InputValue().getParticipant()
    let height = InputValue().getHeight()
    let list = InputValue().fillPlayersWith(participants)
    
    let leg = LadderStep(step: [true, false])
    
    let ladder = LadderGame(height: height, names: list, step: leg.step).makeLadderWith()
    
    ResultValue(ladder: ladder, players: list).printOut()
}

main()
