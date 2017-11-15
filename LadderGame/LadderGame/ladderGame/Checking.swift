//
//  InfomationDataObject.swift
//  ladderGame
//
//  Created by Choi Jeong Hoon on 2017. 11. 14..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

// 사다리 생성 위한 값을 체크하는 객체
struct CheckingValue {
    enum ErrorMessage: String, Error {
        case OfParticipants = "참가자 수를 다시 입력해주세요. (2명 이상, 5명 이하)"
        case OfHeightOfLadder = "사다리 줄수를 다시 입력해주세요. (2줄 이상, 5줄 이하)"
    }
    
    // 체킹된 값을 토대로 정상값 or 에러메세지를 출력하는 메서드
    func returnResultOfChecking (_ players: Array<String>, _ height: Int)  throws -> (Array<String>, Int) {
        guard let participants = checkCountOfparticipants(players) else { throw ErrorMessage.OfParticipants }
        guard let heightOfLadder = checkladderOfHeight(height) else { throw ErrorMessage.OfHeightOfLadder }
        return (participants, heightOfLadder)
    }
    
    // 참가자수 범주 체크 <2명이상 5명 이하)
    private  func checkCountOfparticipants (_ player: Array<String>)  -> Array<String>? {
        if player.count >= 2 && player.count <= 5 {
            return player
        }
        return nil
    }
    
    // 사다리 높이 범주 체크
    private  func checkladderOfHeight (_ height: Int)-> Int? {
        if height >= 2 && height <= 5 {
            return height
        }
        return nil
    }
}

