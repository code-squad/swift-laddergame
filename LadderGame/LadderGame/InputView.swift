//
//  inputView.swift
//  LadderGame
//
//  Created by oingbong on 2018. 7. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    func convertSubstringToLadderPlayerInArray(player:Array<Substring>) -> Array<LadderPlayer> {
        var players:Array<LadderPlayer> = Array<LadderPlayer>()
        for p in player {
            guard p.count < 5 else {
                print("이름은 최대5글자까지 부여할 수 있습니다.")
                main()
                break
            }
            players.append(LadderPlayer.init(name: String(p)))
        }
        return players
    }
    
    func getPerson() -> Array<LadderPlayer> {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let inputPlayers = readLine()!.split(separator: ",")
        
        return convertSubstringToLadderPlayerInArray(player: inputPlayers)
    }
    
    func getLadder() -> Int {
        print("최대 사다리 높이는 몇 개인가요?")
        let inputLadder:String = readLine()!
        
        return Int(inputLadder)!
    }
    
}
