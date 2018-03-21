//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation


func ladderPrint(_ ladderFromArray: Array<Array<Bool>>) {
    for connectArray in ladderFromArray {
        var output = LADDERGAME_LADDER
        for isConnect in connectArray {
            output += (isConnect) ? LADDERGAME_LADDER_CONNECT : LADDERGAME_LADDER_DISCONNECT
            output += LADDERGAME_LADDER
        }
        print(output)
    }
}

func main() {
       print(LADDERGAME_USER_COUNT_MESSAGE)
    do {
        let userCount = try number()
        print(LADDERGAME_HEIGHT_COUNT_MESSAGE)
        let ladderHieght = try number()
        
        let ladderArray = try makeLadderArray(userCount, ladderHieght)
        ladderPrint(ladderArray)
        
    } catch {
        print("사다리 게임 에러")
        return
    }
}
main()
