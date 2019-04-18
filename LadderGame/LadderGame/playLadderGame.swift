//
//  playLadderGame.swift
//  LadderGame
//
//  Created by 이희찬 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

func request()->Array<Int>{
    let input = UserInputManage()
    print("플레이어 수를 입력하세요")
    let playerNumber = input.convertInt(input.removeOptional(input.requestNumber))
    print("사다리 높이를 입력하세요")
    let ladderHeight = input.convertInt(input.removeOptional(input.requestNumber))
    return [playerNumber,ladderHeight]
}
