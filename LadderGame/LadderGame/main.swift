//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGameValue {
    let playerNumber:Int //readLine()
    let ladderHeight:Int //readLine()
    
    var ladderWidthLength:Int {
        return ((playerNumber-1) * 2) + 1
    }
    
    lazy var ladders:[[Character]] =
        Array(repeating:Array(repeating: " ", count:ladderWidthLength), count: ladderHeight)
    
    var widthLadderNumber:Int {
        return Int(arc4random_uniform(UInt32(((playerNumber - 1) / 2) * ladderHeight)))
    }
    
    var heightCoordinate:Int {
        get{
            return Int(arc4random_uniform(UInt32(ladderHeight)))
        }
    }
    
    var widthCoordinate:Int {
        get{
            return (Int(arc4random_uniform(UInt32(playerNumber-1))) * 2) + 1
        }
    }
    
    mutating func addHeight(){
        for i in 0..<playerNumber{
            for j in 0..<ladderHeight{
                ladders[j][i*2] = "ㅣ"
            }
        }
    }
    
    mutating func addWidth(){
        var index = 0
        let laddernum = widthLadderNumber
        while index < laddernum{
            let height = heightCoordinate, width = widthCoordinate
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
    }
    
    mutating func resultprint(){
        for i in ladders{
            print(String(i))
        }
    }
    
    init (playerNumber:Int,ladderHeight:Int){
        self.playerNumber = playerNumber
        self.ladderHeight = ladderHeight
    }

}

let ladderplay = play()
ladderplay.startLaddergame()
