//
//  LadderError.swift
//  LadderGame
//
//  Created by Jun ho Lee on 2018. 10. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

//에러 체크를 위한 프로토콜
protocol ErrorCheck {
    var players : [LadderPlayer] {get}
    var height : Int {get}
    func checkNameError(players: [LadderPlayer]) -> ErrorCase
    func checkHeightError(height: Int) -> ErrorCase
    func checkPlayerError(players: [LadderPlayer]) -> ErrorCase
}

//에러 체크를 위한 구조체
struct LadderGameError: ErrorCheck {
    
    private(set) var players: [LadderPlayer]
    private(set) var height: Int
    
    //프로토콜에 따른 properties 초기화
    init(players: [LadderPlayer], height: Int) {
        self.players = players
        self.height = height
    }
    
    //이름 길이가 5이하인지
    func checkNameError(players: [LadderPlayer]) -> ErrorCase {
        for player in players {
            if player.name.count > 5 {
                return ErrorCase.exceedNameCharactors
            }
        }
        return ErrorCase.none
    }
    
    func checkPlayerError(players: [LadderPlayer]) -> ErrorCase {
        if players.count < 2 {
            return ErrorCase.lackPlayers
        }
    return ErrorCase.none
}
    
    // 길이가 유효범위인지
    func checkHeightError(height: Int) -> ErrorCase {
        if height < 1 || height > Int.max {
            return ErrorCase.wrongHeight
        }
        return ErrorCase.none
    }
    
}

// 예상되는 에러 케이스
enum ErrorCase: String {
    case none
    case nilValue
    case wrongHeight
    case exceedNameCharactors
    case lackPlayers
    
    //케이스에 따른 경고문 반환
    func message() -> String {
        switch self {
        case .nilValue: return "Error: 값이 손상되었습니다."
        case .wrongHeight: return "Error: 높이값을 확인해주세요(0<h<\(Int.max))"
        case .exceedNameCharactors: return "Error: 이름 최대 길이는 5글자입니다."
        case .lackPlayers: return "최소 참가자는 2명입니다."
        case .none: return "정상 입력입니다."
        }
    }
}
