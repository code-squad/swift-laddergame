//
//  userInput.swift
//  LadderGame
//
//  Created by 이희찬 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct UserInputManage{
    
    var requestNumber : String? {
        return readLine()
    }
    
    func removeOptional (_ userResponse:String?)->String{
        if let convertedString = userResponse{
            return convertedString
        }
        return "입력할 값을 다시 확인하세요"
    }
    
    func convertInt (_ convertedString:String)->Int{
        if let convertedInt = Int(convertedString){
            return convertedInt
        }
        return 0
    }
}

struct GetInputMamber {
    func getInputNumber()->Int{
        let userInput = UserInputManage()
        let userResponse = userInput.convertInt(userInput.removeOptional(userInput.requestNumber))
        return userResponse
    }
    func playerNumberRequest()->Int{
        print("플레이어 수를 입력하세요")
        let playerNumber = getInputNumber()
        return playerNumber
    }
    
    func ladderHeightRequest()->Int{
        print("사다리 높이를 입력하세요")
        let ladderHeight = getInputNumber()
        return ladderHeight
    }
    
    func LadderGameBasicValueInitMamber()->Array<Int>{
        let playerNumber = playerNumberRequest()
        let ladderHeight = ladderHeightRequest()
        return [playerNumber,ladderHeight]
    }
}

struct LadderGameBasicValue {
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
    
    init (_ initMembers:Array<Int>){
        self.playerNumber = initMembers[0]
        self.ladderHeight = initMembers[1]
    }
}

struct Input {
    func playInput()->LadderGameBasicValue{
        let initMamber = GetInputMamber()
        let members = initMamber.LadderGameBasicValueInitMamber
        let ladderGameBasicValue = LadderGameBasicValue(members())
        return ladderGameBasicValue
    }
}
