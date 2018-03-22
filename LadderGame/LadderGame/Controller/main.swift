//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation


func ladderPrint(_ ladderConnectFrom: Array<Array<Bool>>) {
    for connectArray in ladderConnectFrom {
        print(LADDERGAME_LADDER, terminator: "")
        for isConnect in connectArray {
            print((isConnect) ? LADDERGAME_LADDER_CONNECT : LADDERGAME_LADDER_DISCONNECT, terminator: LADDERGAME_LADDER)
        }
        print()
    }
}

func main() {
       print(LADDERGAME_USER_COUNT_MESSAGE)
    do {
        let userCount = try number()
        print(LADDERGAME_HEIGHT_COUNT_MESSAGE)
        let ladderHieght = try number()
        
        let ladderConnectForm = try makeLadderCunnectionForm(userCount, ladderHieght)
        ladderPrint(ladderConnectForm)
        
    } catch {
        print("사다리 게임 에러")
        return
    }
}
main()
