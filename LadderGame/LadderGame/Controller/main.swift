//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation


func ladderPirnt(_ ladderFromArray: Array<Array<String>>) {
    for ladderLine in ladderFromArray {
        var ladderLineOutput = ""
        for ladder in ladderLine {
            ladderLineOutput += ladder
        }
        print(ladderLineOutput)
    }
}

func main() {

    do {
        print(LADDERGAME_USER_COUNT_MESSAGE)
        let userCount = try number()
        print(LADDERGAME_HEIGHT_COUNT_MESSAGE)
        let ladderHieght = try number()

        let makeLadderFrom = try makeLadderArray(userCount, ladderHieght)
        ladderPirnt(makeLadderFrom)
       
    } catch {
        print("사다리 게임 에러")
        exit(0)
    }
}
main()
