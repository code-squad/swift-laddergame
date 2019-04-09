//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


typealias   userInput = (Int,Int)
typealias ladderFrame = (Int,Int)
typealias  poles = [[String]]
typealias  foots = [[String]]
typealias  ladder = [[String]]


func ladderGame(){
    let userInput = input()
    let ladderData : ladder = makeLadder(userInput: userInput)
    
    
    output(ladderData: ladderData)
    
}

func output(ladderData:ladder){
    
    for line in ladderData {
        for unit in line {
            print(unit, separator: "", terminator: "")
            
        }
        print()
    }
    
}

func input()->(ladderFrame){
    let numberOfPeople = getNumberOfPeople()
    let ladderHeight = getLadderHeight()
    
    return (numberOfPeople,ladderHeight)
}

func getNumberOfPeople()->Int{
    print("참여할 사람은 몇 명 인가요?")
    return Int.init(readLine()!)!
}

func getLadderHeight()->Int{
    print("최대 사다리 높이는 몇 개인가요?")
    return Int.init(readLine()!)!
}

func makeLadder(userInput:userInput)->(ladder){
    
    
    
    let ladderFrame  = (userInput.0,userInput.1)
    
    let poles = makePole(ladderFrame: ladderFrame)
    
    let foots = makeFoot(ladderFrame: ladderFrame)
    
    let ladder = assemble(poles: poles, foots: foots)
    
    return ladder
    
}

func assemble(poles:poles,foots:foots)->ladder{
    
    let width  = poles[0].count + foots[0].count
    
    let height = poles.count
    var ladder = [[String]]()
    for i in 0..<height{
        var line = [String]()
        for index in 0..<width {
            if(index % 2 == 0){
                line.append(poles[i][index/2])
            }else{
                line.append(foots[i][index/2])
            }
            
        }
        ladder.append(line)
        
    }
    
    return ladder
    
    
}

func makePole(ladderFrame:ladderFrame)->(poles){
    let (width,height) = ladderFrame
    let poles  = fillPattern(ladderFrame: (width,height), patterns: ["|"])
    return poles
}

func makeFoot(ladderFrame:ladderFrame)->(foots){
    let (width,height) = ladderFrame
    let foots  = fillPattern(ladderFrame: (width-1,height), patterns: ["/","-"])
    return foots
    
}

func fillPattern(ladderFrame:ladderFrame,patterns:[String])->[[String]]{
    let (width,height) = ladderFrame
    var lines = [[String]]()
    for _ in 0..<height{
        var line = [String]()
        for _ in 0..<width{
            let  unit = randomPattern(patterns: patterns)
            line.append(unit)
        }
        lines.append(line)
    }
    return lines
}

func randomPattern(patterns:[String])->String{
    
    let random: UInt32 = arc4random_uniform(UInt32(patterns.count))
    let index = Int.init(truncating: NSNumber.init(value: random))
    let selected = patterns[index]
    return selected
}



ladderGame()


