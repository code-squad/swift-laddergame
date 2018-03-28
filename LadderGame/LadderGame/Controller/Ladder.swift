//
//  Ladder.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

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
private func getNotContinuousLadder(_ ladderConnect: Array<Bool> ) -> Array<Bool>{
    var notContinuousLadder = ladderConnect
    
    // 마지막 값은 체크 할 필요가 없으므로 -2
    for index in 0 ... (notContinuousLadder.count - 2) {
        notContinuousLadder[index] = contiuousChecker(notContinuousLadder[index], notContinuousLadder[index + 1])
    }
    
    return notContinuousLadder
}

// 연속적인 값인지 확인
private func contiuousChecker(_ frontIsConnect: Bool, _ nextIsConnect: Bool) -> Bool{
    
    // 두 값이 같은지 확인
    guard frontIsConnect == nextIsConnect else {
        return frontIsConnect
    }
    
    // 연결이 되어 있는지 확인
    guard frontIsConnect else {
        return frontIsConnect
    }
    
    return false
}

private func randomNumber() -> Int {
    return Int(arc4random_uniform(UINT32_MAX))
}

private func inspetionUserCount(_ userCount: Int) throws -> Int{
    guard userCount != 0    else    { throw LadderGameError.zeroError  }
    guard userCount > 0     else    { throw LadderGameError.minusError }
    guard userCount < 10    else    { throw LadderGameError.limitError }
    return userCount
}

private func inspetionLadderHeight(_ ladderHeight: Int) throws -> Int {
    guard ladderHeight != 0 else    { throw LadderGameError.zeroError  }
    guard ladderHeight > 0  else    { throw LadderGameError.minusError }
    guard ladderHeight < 10 else    { throw LadderGameError.limitError }
    return ladderHeight
}

func makeLadderCunnectionForm(_ userCount: Int, _ ladderHeight: Int) throws -> Array<Array<Bool>> {
    let provenUserCount = try inspetionUserCount(userCount)
    let provenLadderHeight = try inspetionLadderHeight(ladderHeight)
    var ladderConnectForm: Array<Array<Bool>> = []
    
    for _ in 1 ... provenLadderHeight {
        ladderConnectForm.append(getNotContinuousLadder(getLadderConnect(provenUserCount)))
    }
    
    return ladderConnectForm
}
