//
//  LadderGame.swift
//  LadderGame
//
//  Created by cushy k on 27/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    
    private var people : LadderPlayer
    private var height = 0
    
    init(people: LadderPlayer, height: Int) {
        self.people = people
        self.height = height
    }
    
    /**
     return a makeFullLadder(people:maxLadder)
     
     - parameters:
         - people: names of player
         - maxLadder: ladders's height
     
     - returns:
         makeFullLadder(people:maxLadder)
    */
    func FullLadder() -> [[LadderStep]] {
        let fullLadder = makeFullLadder(people, height)
        return fullLadder
    }
    
    
    /**
     make a complete ladder
     
     - parameters:
         - people: names of player
         - maxLadder: ladders's height
     
     - returns:
         expands a row by a height.
     */
    private func makeFullLadder(_ people: [LadderPlayer], _ maxLadder: Int) -> [[LadderStep]] {
        var ladders = [[LadderStep]]()
        while ladders.count < maxLadder {
            let part = makeLadderPart(from: people)
            ladders.append(part)
        }
        return ladders
    }
    
    /**
     make a row ladder
     
     - parameters:
         - pople: names of player
     
     - returns:
        a row ladder
    */
    private func makeLadderPart(from people: [LadderPlayer]) -> [LadderStep] {
        var ladders: [LadderStep] = Array(repeating: LadderStep(), count: people.count - 1)
        guard !ladders.isEmpty else {
            return []
        }
        
        for index in 0..<people.count - 1 {
            ladders[index].step = Inspection.inspectExcept(ladders, index)
        }
        return ladders
    }

    /**
     make a array from string
     
     - parameters:
         - name: names of players
     
         *e.g) "oingbong, bran"*
     
     - returns:
         array of names
     
         ```
         ["oingbomg" , "bran"]
    */
    static func extract(_ name: String) -> [String] {
        return name.split(separator: ",").map{ String($0) }
    }
}

