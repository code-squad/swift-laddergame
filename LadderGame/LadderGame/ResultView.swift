//
//  ResultView.swift
//  LadderGame
//
//  Created by jang gukjin on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 결과를 출력하는 구조체
struct ResultView {
    func printLayerOfLadder(layerOfLadder : [Int]){
        print("  |", terminator : "")
        for ladder in layerOfLadder {
            switch ladder{
            case 1:
                print("-----|", terminator : "")
            default :
                print("     |", terminator : "")
            }
        }
    }
    
    func printLadder(ladders : [[Int]], names : [String]){
        for layerOfLadder in ladders{
            printLayerOfLadder(layerOfLadder: layerOfLadder)
            print("")
        }
        for name in names{
            switch name.count{
            case 1:
                print("  "+name+"  ", terminator : " ")
            case 2:
                print("  "+name+" ", terminator : " ")
            case 3:
                print(" "+name+" ", terminator : " ")
            case 4:
                print(" "+name, terminator : " ")
            default:
                print(name, terminator : " ")
            }
        }
    }
}
