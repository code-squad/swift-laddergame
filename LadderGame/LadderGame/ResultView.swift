//
//  ResultView.swift
//  LadderGame
//
//  Created by cushy k on 27/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

enum LineType {
    case step
    case nothing
    var description: String {
        switch self {
        case .step:
            return "------"
        case .nothing:
            return "      "
        }
    }
}

struct ResultView {
    /**
     print a complete ladder
    */
    static func printFull(of game: LadderGame) {
        for ladder in game.fullLadder() {
            printPart(of: ladder)
            print()
        }
    } 
    
    /**
     print a vertical line
     */
    static func printPart(of ladders: [LadderStep]) {
        print("  |", terminator: "")
        for part in ladders {
            let line = transform(from: part.step)
            print(line, terminator: "|")
        }
    }
    
    /**
     print a name
     
     - parameters:
         - people: names of player
     
         *e.g) ["justin", "drake"]
    */
    static func printName(of players: LadderGame) {
        for one in players.names() {
            let space = width(from: one.name)
            print("\(space.front)\(one.name)\(space.back)", terminator: "")
        }
    }
    
    /**
     create a width for names
 
     - parameters:
         - player: name of player
 
             e.g) jamie
     - returns:
          white space
     */
    
    private static func width(from player: String) -> (front: String, back: String) {
        let width = 6
        var front = ""
        var back = ""
        let range = (width - player.count) / 2
        for _ in 0..<range {
            front.append(" ")
        }
        for _ in 0...(width - player.count - range) {
            back.append(" ")
        }
        return (front, back)
    }
    
    /**
     change a bool to a line type
     
     - parameters:
         - value: boolean of a row ladder
     
     - returns:
         line type
         ```
         *e.g) "-----", "     "
         ```
    */
    private static func transform(from value: Bool) -> String {
        let line = LineType.step.description
        let noLine = LineType.nothing.description
        return value ? line : noLine
    }
}
