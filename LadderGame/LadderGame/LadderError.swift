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
    
    func checkInputError(players: [LadderPlayer], height: Int) -> LadderGameError.ErrorCase
}


struct LadderGameError: ErrorCheck {
    
    var players: [LadderPlayer]
    var height: Int
    
    //프로토콜에 따른 properties 초기화
    init(players: [LadderPlayer], height: Int) {
        self.players = players
        self.height = height
    }
    
    func checkInputError(players: [LadderPlayer], height: Int) -> ErrorCase {
        for player in players {
            if  player.name.count > 5 {
                return ErrorCase.exceedNameCharactors
            }
        }
        if height < 0 || height > Int.max {
            return ErrorCase.wrongHeight
        }
        return ErrorCase.none
    }
    
    // 예상되는 에러 케이스
    enum ErrorCase: String {
        case none
        case nilValue
        case wrongHeight
        case exceedNameCharactors
        
        //케이스에 따른 경고문 반환
        func message() -> String {
            switch self {
            case .nilValue: return "Error: 값이 손상되었습니다."
            case .wrongHeight: return "Error: 높이값을 확인해주세요(0<h<\(Int.max))"
            case .exceedNameCharactors: return "Error: 이름 최대 길이는 5글자입니다."
            case .none: return "정상 입력입니다."
            }
        }
    }
    
}
