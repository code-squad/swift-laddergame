//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
/**
 간단한 사다리 게임을 구현한다.
 n개의 사람과 m개의 사다리 개수를 입력할 수 있어야 한다.
 사다리는 랜덤으로 있거나 없을 수도 있다.
 사다리가 있으면 -를 표시하고 없으면 " " 빈공백을 표시한다. 양옆에는 |로 세로를 표시한다.
 사다리 상태를 화면에 출력한다. 어느 시점에 출력할 것인지에 대한 제약은 없다.
 struct 작성하지 않고 함수만으로 구현해본다.
 프로그래밍 요구사항
 
 메소드가 너무 많은 일을 하지 않도록 분리하기 위해 노력해 본다.
 실행 결과
 
 위 요구사항에 따라 3명의 사람을 위한 5개 높이 사다리를 만들 경우, 프로그램을 실행한 결과는 다음과 같다.
 참여할 사람은 몇 명 인가요?
 3
 최대 사다리 높이는 몇 개인가요?
 5
 |-| |
 | |-|
 |-| |
 | |-|
 |-| |
 힌트
 
 랜덤값은 arc4random_uniform() 함수를 활용할 수 있다.
 2차원 배열을 활용하자.
 값이 있거나 없다면 Bool 타입을 사용할 수 있다.
 */


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


