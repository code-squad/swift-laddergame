//
//  inputView.swift
//  LadderGame
//
//  Created by oingbong on 2018. 7. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    private static func checkLadder(ladderHeight: String?) -> Int? {
        guard let height = ladderHeight else { return 0 }
        
        if height.isEmpty {
            print("사다리 높이를 다시 입력해주세요.")
            return getLadder()
        }
        
        return Int(height)
    }

    private static func checkPlayers(players:Array<String>) -> Array<LadderPlayer> {
        var ladderPlayers:Array<LadderPlayer> = Array<LadderPlayer>()

        if players.count < 2 {
            print("두명 이상 입력해주세요.")
            return getPlayers()
        }
        
        for player in players {
            if player.count > 5 {
                print("이름은 최대5글자까지 부여할 수 있습니다.")
                return getPlayers()
            }
            ladderPlayers.append(LadderPlayer.init(name: String(player)))
        }
        return ladderPlayers
    }
    
    public static func getPlayers() -> Array<LadderPlayer> {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        
        // 입력값 없이 엔터쳐도 해당 부분에 걸리지 않습니다.
        // 또한, guard에서 isEmpty값을 같이 처리하려는 경우 옵셔널 강제추출을 하게 되어 다른 메소드에서 조건을 확인합니다.
        guard let input = readLine() else { return [] }
        
        let inputPlayer = input.components(separatedBy: ",")
        
        return checkPlayers(players: inputPlayer)
    }
    
    public static func getLadder() -> Int? {
        print("최대 사다리 높이는 몇 개인가요?")

        guard let input = readLine() else { return 0 }
        return checkLadder(ladderHeight: input)
    }
    
}
