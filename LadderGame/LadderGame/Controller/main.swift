//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

do {
    let usercount = try userCountInput()
    let ladderheight = try ladderHeightInput()

    let ladder = try makeLadder(userCount: usercount, ladderHeight: ladderheight)
   
    for count in 0 ..< ladder.count {
        let output = makeLadderLineOutputFrom(ladderLine: ladder[count])
        print(output)
    }
    
} catch LadderGameError.isEmptyError {
    print(LADDERGAME_ISEMPTY_ERROR_MESSAGE)
} catch LadderGameError.convertError {
    print(LADDERGAME_CONVERT_ERROR_MESSAGE)
} catch LadderGameError.minusError {
    print(LADDERGAME_MINUS_ERROR_MESSAGE)
} catch LadderGameError.limitError {
    print(LADDERGAME_LIMIT_ERROR_MESSAGE)
} catch LadderGameError.zeroError {
    print(LADDERGAME_ZERO_ERROR_MESSAGE)
}


