//
//  LadderGame.swift
//  LadderGame
//
//  Created by Jun ho Lee on 2018. 10. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    // 입력값을 가져옴
    private let players: [LadderPlayer]
    private let height: Int
    
    init(players: [LadderPlayer], height: Int) {
        self.players = players
        self.height = height
    }
    
    // LadderStep들로 된 배열을 반환
    private func makeOneLine() -> [LadderStep] {
        //배열 선언 후 첫요소
        var oneLine = Array<LadderStep>(repeating: LadderStep(), count: players.count-1)
        //중복 안되게 생성하여 배열에 추가
        for stepIndex in 0..<players.count-2 {
            let oneStep = checkPriorStep(lastStep: oneLine[stepIndex])
            oneLine[stepIndex+1] = oneStep
        }
        return oneLine
    }
    
    // LadderStep의 이전 요소와 중복되지 않게 검사
    private func checkPriorStep(lastStep: LadderStep) -> LadderStep {
        let nextStep = LadderStep()
        return nextStep.decideStep(pastStep: lastStep)
    }
    
    // 배열을 모아 이중 배열을 반환
    func completeWholeLadder() -> [[LadderStep]] {
        var wholeLadder = Array<[LadderStep]>()
        for _ in 0..<height {
            wholeLadder.append(makeOneLine())
        }
        return wholeLadder
    }
}
