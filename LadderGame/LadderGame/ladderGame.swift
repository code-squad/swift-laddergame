//
//  ladderGame.swift
//  LadderGame
//
//  Created by 김장수 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// LadderGame 객체는 사다리를 추상화한 형태로 생성

struct LadderGame {
    var height = 0
    var names : [LadderPlayer]
    
    // 사다리를 만드는 함수
    func buildLadderWith(_ elements: (Int, Int), _ legs: [Bool]) -> [[Bool]] {
        let people = elements.0, height = elements.1
        var steps = Array(repeating: [Bool](), count: height)
        
        for i in 0..<height {
            steps[i] = makeOneStepAlong(people, legs)
        }
        
        return steps
    }
    
    // --------------------내부에서만 호출하는 메소드---------------------
    
    // 중복을 바꿔주는 함수
    private func changeLegToEmpty(before: Bool, after: Bool) -> Bool {
        var result = after
        
        if before == true && after == true {
            result = false
        }
        
        return result
    }
    
    // 사다리가 옆으로 연속해서 나오는 걸 방지하는 함수
    private func preventOverlap(legs: [Bool]) -> [Bool] {
        var refined = legs
        
        for i in 0..<(refined.count-1) {
            refined[i+1] = changeLegToEmpty(before: refined[i], after: refined[i+1])
        }
        
        return refined
    }
    
    // 사다리가 옆으로 연속해서 나오지 검증하는 함수
    // 연속해서 나올 가능성이 있을/없을 경우로 분리
    private func checkSuccession(line: [Bool]) -> [Bool] {
        if line.count > 1 {
            let preventedLegs = preventOverlap(legs: line)
            return preventedLegs
        }
        
        return line
    }
    
    // 한 계단을 만드는 함수
    private func makeOneStepAlong(_ number: Int, _ legs: [Bool]) -> [Bool] {
        var step = [Bool]()
        
        for _ in 1..<number {
            step.append(legs[Int(arc4random_uniform(2))])
        }
        
        let checkedStep = checkSuccession(line: step)
        return checkedStep
    }
}
