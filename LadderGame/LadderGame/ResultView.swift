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
    
    
    
     private func printName(of people: [LadderPlayer]) {
        for one in people {
            var space = makeWidth(one)
            print("\(space.front)\(one)\(space.back)", terminator: "")
        }
    }
    
    private func makeWidth(_ name: String) -> (front: String, back: String) {
        let width = 6
        var front = " "
        var back = " "
        let range = (width - name.count) / 2
        for _ in 0...range {
            front += " "
        }
        for _ in 0...(width - name.count - range) {
            back += " "
        }
        return (front, back)
    }
    
    private static func transform(value: Bool) -> String {
        let line = Decoration(type: .step).type.description
        let noLine = Decoration(type: .nothing).type.description
        return value ? line : noLine
    }
}
