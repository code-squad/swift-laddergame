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
        case OfParticipants = "입력가능한 범위에 맞게 다시 입력해주세요. (2명 이상, 5명 이하)"
        case OfHeightOfLadder = "입력가능한 범위에 맞게 다시 입력해주세요. (2줄 이상, 5줄 이하)"
    }
    
    func returnResultOfChecking (_ players: Array<String>, _ height: Int)  throws -> (Array<String>, Int) {
        guard let players = checkCountOfparticipants(players) else { throw ErrorMessage.OfParticipants }
        guard let height = checkladderOfHeight(height) else { throw ErrorMessage.OfHeightOfLadder }
        return (players, height)
    }
    
    private  func checkCountOfparticipants (_ player: Array<String>)  -> Array<String>? {
        if player.count >= 2 && player.count <= 5 {
            return player
        }
        return nil
    }
    
    private  func checkladderOfHeight (_ height: Int)-> Int? {
        if height >= 2 && height <= 5 {
            return height
        }
        return nil
    }
}

