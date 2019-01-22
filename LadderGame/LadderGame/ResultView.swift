//
//  ResultView.swift
//  LadderGame
//
//  Created by cushy k on 27/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    // print full ladder
    static func printFull(_ ladders: [[Bool]]) {
        for ladder in ladders {
            printPart(of: ladder)
            print()
        }
    }
    
    // print a line of ladder
    static func printPart(of ladders: [Bool]) {
        print("|", terminator: "")
        for part in ladders {
            let line = transform(value: part)
            print(line, terminator: "|")
        }
    }
    
    private static func transform(value: Bool) -> String {
        return value ? " " : "-"
    }
}
