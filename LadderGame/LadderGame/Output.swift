//
//  Output.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
/*
 들여쓰기 depth를  1단계로 줄이기
 메소드의 라인 최대 10줄
 method가 한 가지일만 하도록
 
 */

import Foundation
struct Output {
    static func printLadder(_ ladderMatrix:[[String]]){
        for row in ladderMatrix{
            print("|", terminator:"")
            print(row.joined(separator: ""), terminator:"")
            print()
        }
    }
}
