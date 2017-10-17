//
//  InputView.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

struct InputView {

    func ladderPlayer(inputNames: String) -> [LadderPlayer] {
        var player = [LadderPlayer]()
        let names = inputNames.split(separator: ",").map(String.init)
        for name in names {
            let p = LadderPlayer(name: name)
            player.append(p)
        }
        return player
    }
    func height(height: String) -> Int {
        return Int(height) ?? 0
    }
}
