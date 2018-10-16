//
//  LadderGame.swift
//  LadderGame
//
//  Created by Jun ho Lee on 2018. 10. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    // LadderStep들로 된 배열을 반환
    private func makeOneLine(players: [LadderPlayer]) -> [LadderStep] {
        //인원수 에러 체크
        let inputCheck = LadderGameError(players: players, height: 3)
        if inputCheck.checkPlayerError(players: players) == ErrorCase.lackPlayers {
            return Array<LadderStep>()
        }
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
    func completeWholeLadder(players: [LadderPlayer], height: Int) -> [[LadderStep]] {
        //빈 배열 생성
        var wholeLadder = Array<[LadderStep]>()
        //높이 에러 체크
        let inputCheck = LadderGameError(players: players, height: height)
        if inputCheck.checkHeightError(height: height) == ErrorCase.wrongHeight {
            return wholeLadder
        }
        // 이중배열 생성
        for _ in 0..<height {
            wholeLadder.append(makeOneLine(players: players))
        }
        return wholeLadder
    }
}
