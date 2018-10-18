//
//  InputView.swift
//  ladderCony
//
//  Created by Elena on 18/10/2018.
//  Copyright © 2018 elena. All rights reserved.
//

import Foundation

extension String {
    // String.SubSequence ? 도 궁금..??
    /*
     func splitByComma() -> [String] {
     return self.split(separator: ",").map{String($0)}
     }
     // 로 만들었을때는 readPlayerNames()
     checkPlayerName(commaName) ? commaName.compactMap {LadderPlayer(name: String($0))} : nil
     이부분을 접근할때 문자 하나씩 접근하는데..
     아래와 같이 SubSequence 로 접근하니깐 단어 하나씩 접근한다. 검색을 하고 이것저것 해보다보니 결론은 얻었으나?
     왜? 그런지는 찾지 못하였다.
     */
    func splitByComma() -> [String.SubSequence] {
        return self.split(separator: ",")
    }
}

struct InputView {
    //input
    static private func readInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    static func getUserLadder() -> Int {
        let height = readInput(ment: "최대 사다리 높이는 몇 개인가요?")
        return Int(height) ?? 0
    }
    
    static private func readPlayerName() -> String {
        let players = readInput(ment: "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        return players
    }
    
    private static func checkPlayerName(_ players: [String.SubSequence]) -> Bool {
        if players.contains(where: {String($0).count > 5}) {
            return false
        }
        return true
    }
    
    static func readPlayerNames() -> [LadderPlayer]?{ //[String]? {
        let playerName = readPlayerName()
        let commaName = playerName.splitByComma()
        // 아래 부분 이해가 잘 안됨...https://zeddios.tistory.com/448 보고 사용
        return checkPlayerName(commaName) ? commaName.compactMap {LadderPlayer(name: String($0))} : nil
    }
}


