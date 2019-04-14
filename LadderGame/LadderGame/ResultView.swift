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
        for ladder in layerOfLadder {
            switch ladder{
            case 1:
                print("-----", terminator : "")
            default :
                print("     ", terminator : "")
            }
        }
    }
    
    func printLadder(ladders : [[Int]], names : [String]){
        for layerOfLadder in ladders{
            print(printLayerOfLadder(layerOfLadder: layerOfLadder))
        }
        for name in names{
            print(name, terminator : "")
        }
    }
}
