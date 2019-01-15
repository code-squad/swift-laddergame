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
    static func printFull(_ ladders: [[String]]) {
        for ladder in ladders {
            printPart(of: ladder)
            print()
        }
    }
    
    // print a line of ladder
    static func printPart(of ladders: [String]) {
        print("|", terminator: "")
        for part in ladders {
            print(part, terminator: "|")
        }
    }
}
