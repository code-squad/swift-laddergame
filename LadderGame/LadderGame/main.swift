//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
let names = readLine()?.split(separator: ",")

print("최대 사다리 높이는 몇 개 인가요?")
let height = readLine()
let heightOfLadders = Int(height ?? "0") ?? 0

var players = [LadderPlayer]()
if let names = names {
    for name in names {
        players.append(LadderPlayer(name: String(name)))
    }
}

let game = LadderGame(players: players, height: heightOfLadders)
let resultView = ResultView(game: game)
resultView.printout()

