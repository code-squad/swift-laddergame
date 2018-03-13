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
 
 위 3개 다 메소드를 분리하기
 
  Output은 LadderGame이 넘겨준 값으로 사다리 출력
 */

import Foundation
struct Output {
    func printLadder(_ ladderMatrix:[[String]]){
        for row in ladderMatrix{
            print("|", terminator:"")
            print(row.joined(separator: ""), terminator:"")
            print()
        }
    }
}
