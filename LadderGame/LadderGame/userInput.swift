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
        let fail = " "
        if let convertedString = userResponse{
            return convertedString
        }
        return fail
    }
    
    func convertInt (_ convertedString:String)->Int{
        let fail = 0
        if let convertedInt = Int(convertedString){
            return convertedInt
        }
        return fail
    }
}

struct InputMamber {
    func isString()->String{
        let fail = " "
        let userInput = UserInputManage()
        let optionalString = userInput.requestNumber
        let convertedString = userInput.removeOptional(optionalString)
        if convertedString is String {
            return convertedString
        }
        return fail
    }
    
    func isInt (_ convertedString:String)->Int{
        let fail = 0
        let userInput = UserInputManage()
        let convertedInt = userInput.convertInt(convertedString)
        if convertedInt is Int {
            return convertedInt
        }
        return fail
    }
    
    func userInputString() -> String {
        let fail = " "
        var convertedString = isString()
        while convertedString == fail  {
            print("값을 다시 확인하고 입력하세요")
            convertedString = isString()
        }
        return convertedString
    }
    
    func userInputInt() -> Int {
        let fail = 0
        var convertedString = userInputString()
        var convertedInt = isInt(convertedString)
        while convertedInt == fail {
            print("입력한 값을 다시 확인하세요, 정수를 입력해야 합니다")
            convertedString = userInputString()
            convertedInt = isInt(convertedString)
        }
        return convertedInt
        
    }
    

    func userInputNumber()->Int{
        let convertedInt = userInputInt()
        return convertedInt
    }
    
    func isoverOne(_ convertedInt:Int)->Int{
        let fail = 0
        guard convertedInt > 1 else {
            return fail
        }
        return convertedInt
    }
    
    func playerNumber() -> Int {
        let fail = 0
        print("플레이어 수를 입력하세요")
        var userInputNumber = self.userInputNumber()
        var isoverOne = self.isoverOne(userInputNumber)
        while isoverOne == fail {
            print("최소 플레이어수는 2입니다, 플레이어수를 다시 입력해주세요")
            userInputNumber = self.userInputNumber()
            isoverOne = self.isoverOne(userInputNumber)
        }
        return userInputNumber
    }
    
    func ladderHeight() -> Int {
        let fail = 0
        print("사다리 높이를 입력하세요")
        var userInputNumber = self.userInputNumber()
        var isoverOne = self.isoverOne(userInputNumber)
        while isoverOne == fail {
            print("최소 사다리 높이는 2입니다, 사다리 높이를 다시 입력해주세요")
            userInputNumber = self.userInputNumber()
            isoverOne = self.isoverOne(userInputNumber)
        }
        return userInputNumber
    }
    
    func LadderGameBasicValueInitMember()->Array<Int>{
        let playerNumber = self.playerNumber()
        let ladderHeight = self.ladderHeight()
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
        let initMamber = InputMamber()
        let members = initMamber.LadderGameBasicValueInitMember
        let ladderGameBasicValue = LadderGameBasicValue(members())
        return ladderGameBasicValue
    }
}



