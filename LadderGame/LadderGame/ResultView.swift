//
//  ResultView.swift
//  LadderGame
//
//  Created by cocoa on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    let game: LadderGame
    
    func print() {
        game.printLadders()
    }
}
