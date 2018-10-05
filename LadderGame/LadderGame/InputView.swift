//
//  inputView.swift
//  LadderGame
//
//  Created by 김장수 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// InputValue 객체는 사다리 게임을 하는데 필요한 요소를 입력받는 메소드를 보유

struct InputValue {
    // 참가할 사람들의 명단을 입력받는 함수
    func getParticipant() -> String {
        print("참여할 사람 이름을 입력해주세요.")
        let participant = readLine()
        return checkPerson(participant)
    }
    
    // 입력받는 명단을 배열로 분리해주는 함수
    func separate(input: String) -> [String] {
        return input.split(separator: ",").map({String($0)})
    }
    
    // 각각의 참가자들을 이름을 갖는 인스턴스(LadderPlayer)로 만듦
    func fillPlayersWith(_ participants: [String]) -> [LadderPlayer] {
        var ladderPlayers = [LadderPlayer]()
        
        // 각 참가자들의 인스턴스를 players의 names에 넣어주는 부분
        for participant in participants {
            var ladderPlayer = LadderPlayer(name: "")
            ladderPlayer.name = String(participant)
            ladderPlayers.append(ladderPlayer)
        }
        
        return ladderPlayers
    }
    
    // 사다리 높이를 입력받는 함수
    func getHeight() -> Int {
        print("최대 사다리 높이는 몇 개인가요?")
        let height = readLine()
        
        // 옵셔널 처리를 거친 값을 리턴
        return checkNumber(height)
    }
    
    // --------------------내부에서만 호출하는 메소드---------------------
    
    // 입력받은 높이를 옵셔널 체크하는 함수
    private func checkNumber(_ input: String?) -> Int {
        guard input == nil || (input?.isEmpty ?? true) else {
            return Int(input!) ?? 0
        }
        
        return 0
    }
    
    // 입력받는 참가자 명단을 옵셔널 체크하는 함수
    private func checkPerson(_ input: String?) -> String {
        guard input == nil || (input?.isEmpty ?? true) else {
            return input ?? ""
        }
        
        return ""
    }
}

