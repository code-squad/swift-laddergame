//
//  LadderGame.swift
//  LadderGame
//
//  Created by 임차혁 on 2018. 10. 30..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    // 저장프로퍼티 선언
    var height: Int
    var names : [LadderPlayer]
    var ladderStep: [LadderStep] = [LadderStep]()
    
    init(height: Int, names: [LadderPlayer]) {
        self.height = height
        self.names = names
    }
    
    // 사다리 발판을 생성하는 함수들
    func generateRandomBool() -> Bool {
        return arc4random_uniform(2) == 1 ? true : false
    }
    func gernerateRandomBoolSet(playerNum: Int) -> [Bool] {
        var randomBoolSet: [Bool] = []
        for _ in 0...playerNum-1 {
            randomBoolSet.append(generateRandomBool())
        }
        return randomBoolSet
    }
    func checkRepeatBool(randomBoolSet: [Bool]) -> Bool {
        for index in 0..<randomBoolSet.count-1 {
            if randomBoolSet[index] == true && randomBoolSet[index+1] == true {
                return true
            }
        }
        return false
    }
    func generateRightBoolSet() -> [Bool] {
        var rightBoolSet: [Bool] = []

        while true {
            rightBoolSet = gernerateRandomBoolSet(playerNum: names.count-1)
            if checkRepeatBool(randomBoolSet: rightBoolSet) == false {
                break
            }
        }
        return rightBoolSet
    }
    func convertBoolSetToLadderStep() -> [LadderStep] {
        var result: [LadderStep] = [LadderStep]()
        var rightBoolSet: [Bool] = generateRightBoolSet()
        for item in rightBoolSet {
            result.append(LadderStep.init(step: item))
        }
        return result
    }
    func completeWholeLadderStep() -> [[LadderStep]] {
        var result: [[LadderStep]] = [[LadderStep]]()
        for _ in 0..<self.height {
            result.append(convertBoolSetToLadderStep())
        }
        return result
    }
}
