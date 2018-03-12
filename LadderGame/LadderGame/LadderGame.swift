//
//  LadderGame.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    /*
     LadderGame 이 모든 객체를 생성해서 소유하고 있어서 의존성을 갖고 있는 것보다는
     다른 객체가 할 일을 넘겨주도록 (=의존성을 줄이도록) 작성하는 게 좋습니다.
     여기 변수들이 (극단적으로보면) 존재하지 않고, LadderGame을 호출하는 상위 객체에서 넘겨주도록 작성하는 게 좋습니다. 이 부분은 3단계를 할 때 개선해봅시다.
     ->감이 안 잡힘.
     */
    var numberOfPerson:Int = 0
    var heightOfLadder:Int = 0
    var ladderMatrix = [[String]]()
    let printer:Printer = Printer()
    let scanner:Scanner = Scanner()
    
    mutating func start(){
        printer.askNumberOfPerson()
        numberOfPerson = scanner.userInputValue()
        printer.askNUmberOfLadder()
        heightOfLadder = scanner.userInputValue()
        initLadderMatrix()
        makeLadder()
        printer.printLadder(ladderMatrix)
    }
    
    mutating func makeLadder(){
        let numberOfLadder = ( numberOfPerson + heightOfLadder ) / 2
        for _ in 0..<numberOfLadder{
            ladderMatrix[heightOfLadder.arc4random][(numberOfPerson-1).arc4random] = "-|"
        }
    }
    
    mutating func initLadderMatrix(){
        ladderMatrix = Array(repeating: Array(repeating: " |", count: numberOfPerson-1), count: heightOfLadder)
    }
}
