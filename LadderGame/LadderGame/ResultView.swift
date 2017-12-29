//
//  ResultView.swift
//  laddergame
//
//  Created by 김수현 on 2017. 12. 20..
//  Copyright © 2017년 김수현. All rights reserved.
//

import Foundation

struct ResultView {

    func drawHorizontalLadder(_ ladders: [[String]]) {
        for heightIdx in 0..<ladders.count {
            drawVerticalLadder(ladders[heightIdx])
        }
    }
    
    func drawVerticalLadder(_ height: [String]) {
        for playerIdx in height {
            print("|" + playerIdx, terminator:"")
        }
        print("|")
    }
    
    func printBlank(_ nameLength: Int) -> String {
        var blank = " "
        var times = 5 - nameLength
        for _ in 0..<times {
            blank += " "
        }
        return blank
    }
    
}
