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
    private var height = 0
    private var players = [LadderPlayer]()
    private var step = LadderStep()
    private var ladder = [[LadderStep]]()
    
    init?(height: Int, names: String) {
        let people = makeList(names)
        if (3...20).contains(height) == false {
            return nil
        }
        
        if (3...20).contains(people.count) == false {
            return nil
        }
        
        for name in people {
            self.players.append(LadderPlayer.init(name: name))
        }

        self.height = height
        // 인스턴스 생성과 동시에 사다리가 생성되도록 수정
        self.ladder = makeLadderWith()
    }
    
    public func delieverDTO() -> LadderGameDTO {
        var dto = LadderGameDTO()
        
        dto.ladder = ladder
        dto.players = players
        return dto
    }
    
    // 이름을 배열로 바꿔주는 함수
    private func makeList(_ names: String) -> [String] {
        return names.split(separator: ",").map({String($0)})
    }
    
    // 중복을 바꿔주는 함수
    private func changeLegToEmpty(before: LadderStep, after: LadderStep) -> LadderStep {
        var result = after
        
        if before.have && after.have {result = LadderStep(have: false)}
        return result
    }
    
    // 사다리가 옆으로 연속해서 나오는 걸 방지하는 함수
    private func preventOverlap(line: [LadderStep]) -> [LadderStep] {
        var refined = line
        
        for i in 0..<(refined.count-1) {
            refined[i+1] = changeLegToEmpty(before: refined[i], after: refined[i+1])
        }
        return refined
    }
    
    // 한 계단을 만드는 함수
    private func makeOneStepAlong(_ number: Int, _ step: LadderStep) -> [LadderStep] {
        var steps = [LadderStep]()
        var step = step
        
        for _ in 1..<number {
            steps.append(step.isExist(Int(arc4random_uniform(2))))
        }
        return preventOverlap(line: steps)
    }
    
    // 사다리를 만드는 함수
    private func makeLadderWith() -> [[LadderStep]] {
        var steps = Array(repeating: [LadderStep](), count: height)
        
        for i in 0..<height {
            steps[i] = makeOneStepAlong(players.count, step)
        }
        return steps
    }
}
