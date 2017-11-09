//
//  LadderGame.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//
import Foundation

// 사다리 속성과 참가자 정보를 갖는 구조체
struct LadderGame {
    private (set) var participant = [LadderPlayer]()
    
    init (_ names: Array<String>, _ heights: Int) {
        for name in names {
            let player = LadderPlayer.init(name: name)
            participant.append(player)
        }
    }
    
    // 1. 랜덤 불값 생성
    static func makeRandomBooleanValue () -> Bool {
        let randomNum = Int(arc4random_uniform(2))
        guard randomNum % 2 == 0 else { return false }
        return true
    }
    
    // 2. [LadderPlayer]를 String배열로 담아서 리턴
    static func getParticipants (_ input: Array<LadderPlayer>) -> Array<String> {
        var participants = Array<String>()
        for name in 0 ..< input.count {
            participants.append(input[name].name)
        }
        return participants
    }
    
    // 3. 랜덤 불값의 한줄 배열 만들기
    static func makeRandomInnerArray (_ countOfparticipants: Int) -> Array<Bool> {
        var firstArray = Array<Bool>()
        for _ in 0 ..< countOfparticipants-1{
            firstArray.append(makeRandomBooleanValue())
        }
        return firstArray
    }
}
