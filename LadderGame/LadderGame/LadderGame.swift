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
    let players: [LadderPlayer]
    let height: Int
    
    // LadderStep들로 된 배열을 반환
    private func makeOneLine() -> [LadderStep] {
        //배열을 첫요소와 함께 선언
        var oneLine = [LadderStep()]
        //중복 안되게 생성하여 배열에 추가
        for stepIndex in 0..<players.count-2 {
            oneLine.append(checkPriorStep(lastStep: oneLine[stepIndex]))
        }
        return oneLine
    }
    
    // LadderStep의 이전 요소와 중복되지 않게 검사
    func checkPriorStep(lastStep: LadderStep) -> LadderStep {
        if lastStep.dataStep {
            var nextStep = LadderStep()
            nextStep.dataStep = false
            return nextStep
        }
        let nextStep = LadderStep()
        return nextStep
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
