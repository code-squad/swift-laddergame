//
//  InputView.swift
//  LadderGame
//
//  Created by 임차혁 on 2018. 10. 30..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    // 표준입력
    func inputLine() -> String {
        guard let inputString = readLine() else { return "0" }
        return inputString
    }
    // 사다리게임 플레이어 입력
    func inputLadderPlayer() -> [String] {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        return inputLine().split(separator: ",").map{ String($0) }
    }
    // 사다리게임 높이 입력
    func inputLadderHeight() -> String {
        print("최대 사다리 높이는 몇 개인가요?")
        return inputLine()
    }
    // 사다리게임 플레이어의 올바른 이름을 받는다.
    func getLadderUser() -> [String] {
        var result: [String] = []
        for item in inputLadderPlayer() {
            result.append(item.trimmingCharacters(in: .whitespacesAndNewlines))
        }
        return result
    }
    // 사다리게임 높이의 String->Int 값으로 형변환
    func getLadderHeight() -> Int {
        guard let height = Int(inputLadderHeight()) else { return 0 }
        return height
    }
    // 플레이어의 요구사항에 맞는 이름길이를 판단한다.
    func checkPlayerName(_ playerName: [String]) -> Bool {
        for item in playerName {
            if item.count < 1 || item.count > 5 { return false }
        }
        return true
    }
    // 플레이어의 이름 정보를 LadderPlayer구조체로 만들어준다.
    func storeLadderPlayer(ladderUser: [String]) -> [LadderPlayer] {
        var ladderPlayers: [LadderPlayer] = [LadderPlayer]()
        for item in ladderUser {
            ladderPlayers.append(LadderPlayer(name: item))
        }
        return ladderPlayers
    }
}

