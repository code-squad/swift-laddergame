//
//  Input.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Input {
    static let questionNumberOfPerson = "참여할 사람은 몇 명 인가요?"
    static let questionumberOfLadder = "최대 사다리 높이는 몇 개인가요?"
    
    func askNumberOfPerson(){
        print(Printer.questionNumberOfPerson)
    }
    
    func askNUmberOfLadder(){
        print(Printer.questionumberOfLadder)
    }
    
    func printLadder(_ ladderMatrix:[[String]]){
        for row in ladderMatrix{
            print("|", terminator:"")
            print(row.joined(separator: ""), terminator:"")
            print()
        }
    }
}
