//
//  ResultView.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

//출력 담당
struct ResultView {
    
    init(ladderGame: LadderGame) {
        let spaceArray = space(player: ladderGame.names)
        printLadder(ladderArray: ladderGame.ladder, player: ladderGame.names, height: ladderGame.height)
        printName(player: ladderGame.names, space: spaceArray)
    }
    
    private func myPrefix(length: Int) -> Int {
        switch length {
        case 1,2:
            return 0
        case 3:
            return 1
        default:
            return 2
        }
    }
    
    private func myPostfix(length: Int) -> Int {
        switch length {
        case 1:
            return 0
        case 2, 3, 4:
            return 1
        default:
            return 2
        }
    }
    
    func space(player: [LadderPlayer]) -> [Int]{
        var spaceArray = [Int]()
        let pNum = player.count
        for i in 0..<pNum-1 {
            let val = 5 - myPostfix(length: player[i].name.count) - myPrefix(length: player[i+1].name.count)
            spaceArray.append(val)
        }
        spaceArray.append(0)
        return spaceArray
    }
    
    private func makeSpaceToString(spaceCount: Int) -> String {
        var space = ""
        for _ in 0..<spaceCount {
            space += " "
        }
        return space
    }

    func printName(player: [LadderPlayer], space: [Int]) {
        for i in 0..<player.count {
            print(player[i].name, terminator: "")
            let spaceString = makeSpaceToString(spaceCount: space[i])
            print(spaceString, terminator: "")
        }
        print()
    }
    
    private func ladderToString(hasLadder: Bool) -> String{
        return hasLadder ? "-----" : "     "
    }
    
    func printLadder(ladderArray: [[Bool]], player: [LadderPlayer], height: Int) {
        let space = myPrefix(length: player[0].name.count)
        let spaceString = makeSpaceToString(spaceCount: space)
        for i in 0..<height {
            print(spaceString, terminator: "")
            for j in 0..<player.count-1 {
                let ladderString = ladderToString(hasLadder: ladderArray[i][j])
                print("|\(ladderString)", terminator: "")
            }
            print("|")
        }
    }
}
