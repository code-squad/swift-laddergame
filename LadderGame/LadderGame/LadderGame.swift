//
//  LadderGame.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private(set) var height = 0
    private(set) var names : [LadderPlayer] = []
    
    var inputView: InputView
    
    init(inputView: InputView) {
        self.inputView = inputView
        self.height = inputView.heightForLadder
        self.names = inputView.names
    }
  
    func makeRandomValue() -> String {
        let randomValue = arc4random_uniform(2)
        if randomValue == 0 {
            return " "
        }else {
            return "-"
        }
    }
}
