//
//  LadderGame.swift
//  LadderGame
//
//  Created by cushy k on 27/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var height = 0
    private var names : [LadderPlayer]
    
    static func makeFullLadder(_ people: Int, _ maxLadder: Int) -> [[String]] {
        var ladders = [[String]]()
        while ladders.count < maxLadder {
            let part = makeLadderPart(from: people)
            ladders.append(part)
        }
        return ladders
    }
    
    // create one line ladder
    static func makeLadderPart(from people: Int) -> [String] {
        var ladders = [String](repeating: " ", count: people - 1)
        guard !ladders.isEmpty else {
            return []
        }
        for index in 0..<people - 1 {
            ladders[index] = inspectExcept(ladders, index)
        }
        return ladders
    }
    
    // make a horizon line
    func makeHorizon() -> Bool {
        guard arc4random_uniform(2) == 1 else {
            return false
        }
        return true
    }

    // split name into array
    static func getNames(_ input: String) -> [String] {
        return input.split(separator: ",").map{ String($0) }
    }
    


}
