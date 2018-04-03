//
//  Ladder.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
import Foundation

struct LadderGame {
    
    private var height = 0
    private var playerNames : [LadderPlayer]
    
    init(_ playerNames: [LadderPlayer], _ height: Int) {
        self.playerNames = playerNames
        self.height = height
    }
    
    private func getLadderConnect(_ userCount: Int) -> Array<Bool>{
        var ladderConnect: Array<Bool> = []
        
        for _ in 1 ..< userCount {
            ladderConnect.append(isConnect())
        }
        
        return ladderConnect
    }
    
    private func isConnect() -> Bool {
        return (randomNumber() % 2) == 0
    }
    
    // 연속적이지 않은 ladder반환
    private func getNotContinuConnectLadder(_ ladderConnect: Array<Bool> ) -> Array<Bool>{
        guard ladderConnect.count > 2 else {
            return ladderConnect
        }
        
        var notContinuousLadder = ladderConnect
        
        // 마지막 값은 체크 할 필요가 없으므로 -2
        for index in 0 ... (notContinuousLadder.count - 2) {
            notContinuousLadder[index] = continuousLadderChecker(notContinuousLadder[index], notContinuousLadder[index + 1])
        }
        
        return notContinuousLadder
    }
    
    // 연속적인 값인지 확인
    private func continuousLadderChecker(_ frontIsConnect: Bool, _ nextIsConnect: Bool) -> Bool{
        
        // 두 값이 같은지 확인
        guard frontIsConnect == nextIsConnect && frontIsConnect else {
            return frontIsConnect
        }
        
        return false
    }
    
    private func randomNumber() -> Int {
        return Int(arc4random_uniform(UINT32_MAX))
    }
    
    func makeLadderForm() -> Array<Array<Bool>> {
        var ladderConnectForm: Array<Array<Bool>> = []
    
        for _ in 1 ... height {
            ladderConnectForm.append(getNotContinuConnectLadder(getLadderConnect(playerNames.count)))
        }
        
        return ladderConnectForm
    }
}


