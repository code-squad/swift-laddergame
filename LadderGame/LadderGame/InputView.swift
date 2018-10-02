//
//  inputView.swift
//  LadderGame
//
//  Created by 김장수 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputValue {
    // players라는 이름을 가진 LadderGame 인스턴스를 생성
    var ladderGame = LadderGame(height: 0, names: [])
    
    // 참가할 사람들의 명단을 입력받는 함수
    mutating func getParticipant() {
        print("참여할 사람 이름을 입력해주세요.")
        let participant = readLine()
        let checked = checkPerson(participant)
        let participants = separate(input: checked)
        
        fillPlayersWith(participants)
    }
    
    // 사다리 높이를 입력받는 함수
    mutating func getHeight() {
        print("최대 사다리 높이는 몇 개인가요?")
        let height = readLine()
        // 옵셔널 처리를 거친 값을 players의 높이에 넣어주는 부분
        ladderGame.height = checkNumber(height)
    }
    
    
    
    // 입력받는 명단을 배열로 분리해주는 함수
    // getParticipant() 함수에 포함
    private func separate(input: String) -> [String] {
        return input.split(separator: ",").map({String($0)})
    }
    
    // 각각의 참가자들을 이름을 갖는 인스턴스(LadderPlayer)로 만듦
    private mutating func fillPlayersWith(_ participants: [String]) {
        var ladderPlayers = [LadderPlayer]()
        
        // 각 참가자들의 인스턴스를 players의 names에 넣어주는 부분
        for participant in participants {
            var ladderPlayer = LadderPlayer(name: "")
            ladderPlayer.name = String(participant)
            ladderPlayers.append(ladderPlayer)
        }
        
        ladderGame.names = ladderPlayers
    }
    
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

