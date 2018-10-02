//
//  ladderStep.swift
//  LadderGame
//
//  Created by 김장수 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    // 사다리를 만드는 함수
    func buildLadderWith(_ elements: (Int, Int)) -> [[Bool]] {
        let people = elements.0, height = elements.1
        var steps = Array(repeating: [Bool](), count: height)
        
        for i in 0..<height {
            steps[i] = makeOneStepAlong(number: people)
        }
        
        return steps
    }
    
    // 중복을 바꿔주는 함수
    func changeLegToEmpty(before: Bool, after: Bool) -> Bool {
        var result = after
        
        if before == true && after == true {
            result = false
        }
        
        return result
    }
    
    // 사다리가 옆으로 연속해서 나오는 걸 방지하는 함수
    func preventOverlap(legs: [Bool]) -> [Bool] {
        var refined = legs
        
        for i in 0..<(refined.count-1) {
            refined[i+1] = changeLegToEmpty(before: refined[i], after: refined[i+1])
        }
        
        return refined
    }
    
    // 사다리가 옆으로 연속해서 나오지 검증하는 함수
    // 연속해서 나올 가능성이 있을/없을 경우로 분리
    func checkSuccession(line: [Bool]) -> [Bool] {
        if line.count > 1 {
            let preventedLegs = preventOverlap(legs: line)
            return preventedLegs
        }
        
        return line
    }
    
    // 한 계단을 만드는 함수
    func makeOneStepAlong(number: Int) -> [Bool] {
        let legs = [true, false]
        var step = [Bool]()
        
        for _ in 1..<number {
            step.append(legs[Int(arc4random_uniform(2))])
        }
        
        let checkedStep = checkSuccession(line: step)
        return checkedStep
    }
}
