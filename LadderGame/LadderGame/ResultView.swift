//
//  ResultView.swift
//  LadderGame
//
//  Created by cushy k on 27/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    /**
     print a complete ladder
    */
    static func printFull(_ ladders: [[LadderStep]]) {
        for ladder in ladders {
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
            let line = transform(value: part.step)
            print(line, terminator: "|")
        }
    }
    
    /**
     print a name
     
     - parameters:
         - people: names of player
     
         *e.g) ["justin", "drake"]
    */
    static func printName(_ people: [String]) {
        for one in people {
            let space = makeWidth(one)
            print("\(space.front)\(one)\(space.back)", terminator: "")
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
    
    private static func makeWidth(_ player: String) -> (front: String, back: String) {
        let width = 6
        var front = ""
        var back = ""
        let range = (width - player.count) / 2
        for _ in 0..<range {
            front += " "
        }
        for _ in 0...(width - player.count - range) {
            back += " "
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
    private static func transform(value: Bool) -> String {
        let line = Decoration.LineType.step.description
        let noLine = Decoration.LineType.nothing.description
        return value ? line : noLine
    }
}
