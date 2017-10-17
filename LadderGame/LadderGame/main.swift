//
//  main.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation
print("참여할 사람 이름을 입력하세요.")
let n = readLine()
print("최대 사다리 높이는 몇 개인가요?")
let m = readLine()



if let n = n, let m = m {
    let input = InputView()
    let player = input.ladderPlayer(inputNames: n)
    let height = input.height(height: m)
    
    let game = LadderGame(height: height, player: player)
    let ladder = game.makeLadderArray()
    
    let result = ResultView()
    let space = result.space(names: player)
    
    result.printLadder(ladderArray: ladder, names: player, height: height)
    result.printName(names: player, space: space)

}
