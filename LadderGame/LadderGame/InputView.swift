//
//  InputView.swift
//  LadderGame
//
//  Created by MJ.KONG-MAC on 2019/09/04.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    static func players() -> Array<LadderPlayer> {
        print("Please enter a name to join. (Separate names with commas)")
        guard let inputName = readLine() else {
            return []
        }
        let players = inputName.split(separator: ",")
            .map { String($0) }
            .map { LadderPlayer(playerName: $0) }
        return players
    }

    static func heightOfLadder() -> Int {
        print("How many ladders are there?")
        guard let heights = readLine() else {
            return 0
        }
        return Int(heights) ?? 0
    }
    
}
