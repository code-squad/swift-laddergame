//
//  ResultView.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 4. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
struct ResultView {
    static func ladder(_ ladderConnectFrom: Array<Array<Bool>>) {
        for connectArray in ladderConnectFrom {
            print(terminator: "  ")
            print(LADDERGAME_LADDER, terminator: "")
            for isConnect in connectArray {
                print((isConnect) ? LADDERGAME_LADDER_CONNECT : LADDERGAME_LADDER_DISCONNECT, terminator: LADDERGAME_LADDER)
            }
            print()
        }
    }
    
    static func player(_ LadderPlayers: [LadderPlayer]) {
        for player in LadderPlayers {
            print(player.name, terminator: "  ")
        }
        print()
    }
}
