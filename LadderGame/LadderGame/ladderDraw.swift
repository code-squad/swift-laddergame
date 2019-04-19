//
//  ladderDraw.swift
//  LadderGame
//
//  Created by 이희찬 on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct AddLadder {
    
    //임의의 좌표 생성
    func heightCoordinate(_ ladderHeight:Int)->Int{
        return Int(arc4random_uniform(UInt32(ladderHeight)))
    }
    
    func widthCoordinate(_ playerNumber:Int)->Int{
        return (Int(arc4random_uniform(UInt32(playerNumber-1))) * 2) + 1
    }
    
    //세로 사다리 추가
    func addHeight(playerNumber:Int,ladderHeight:Int,ladders:[[Character]])->[[Character]]{
        var ladders = ladders
        for i in 0..<playerNumber{
            for j in 0..<ladderHeight{
                ladders[j][i*2] = "ㅣ"
            }
        }
        return ladders
    }
    
    //가로 사다리 추가
    func addWidth(widthLadderNumber:Int,ladders:[[Character]],ladderHeight:Int,playerNumber:Int,ladderWidthLength:Int)->[[Character]]{
        var ladders = ladders
        var index = 0
        let laddernum = widthLadderNumber
        while index < laddernum{
            let height = heightCoordinate(ladderHeight), width = widthCoordinate(playerNumber)
            guard ladders[height][width] == " " else{
                continue
            }
            switch width {
            case 1 :
                guard ladders[height][width + 2] == " " else{
                    break
                }
                ladders[height][width] = "-"
                index += 1
                
            case ladderWidthLength - 2 :
                guard ladders[height][width - 2] == " " else{
                    break
                }
                ladders[height][width] = "-"
                index += 1
                
            default :
                guard ladders[height][width + 2] == " " else{
                    break
                }
                guard ladders[height][width - 2] == " " else{
                    break
                }
                ladders[height][width] = "-"
                index += 1
            }
        }
        return ladders
    }
}

struct Function {
    func playDraw(ladder:LadderGameBasicValue) -> [[Character]] {
        let ladderDraw = AddLadder()
        var ladder = ladder
        var ladders = ladder.ladders
        ladders = ladderDraw.addHeight(playerNumber: ladder.playerNumber, ladderHeight: ladder.ladderHeight, ladders: ladders)
        ladders = ladderDraw.addWidth(widthLadderNumber: ladder.widthLadderNumber, ladders: ladders, ladderHeight: ladder.ladderHeight, playerNumber: ladder.playerNumber, ladderWidthLength: ladder.ladderWidthLength)
        return ladders
    }
}
