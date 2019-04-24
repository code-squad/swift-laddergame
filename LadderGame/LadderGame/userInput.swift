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
    
    var convertedString = " "
    var convertedInt = 0

    mutating func isString()->Bool{
        let optionalString = requestNumber
        convertedString = removeOptional(optionalString)
        if convertedString == " " {
            return false
        }
        return true
    }
    
    mutating func isInt ()->Bool{
        convertedInt = convertInt(convertedString)
        if convertedInt == 0 {
            return false
        }
        return true
    }
    
    mutating func userInputString() {
        var isString = self.isString()
        while !(isString) {
            print("값을 다시 확인하고 입력하세요")
            isString = self.isString()
        }
    }
    
    mutating func userInputInt() -> Int {
        userInputString()
        var isInt = self.isInt()
        while !(isInt) {
            print("입력한 값을 다시 확인하세요, 정수를 입력해야 합니다")
            userInputString()
            isInt = self.isInt()
        }
    }
    
    func isoverOne()->Bool{
        guard convertedInt > 1 else {
            return false
        }
        return true
    }
    
    mutating func playerNumber() -> Int {
        print("플레이어 수를 입력하세요")
        userInputInt()
        var isoverOne = self.isoverOne()
        while !(isoverOne) {
            print("최소 플레이어수는 2입니다, 플레이어수를 다시 입력해주세요")
            userInputInt()
            isoverOne = self.isoverOne()
        }
    }
    
    mutating func ladderHeight() -> Int {
        print("사다리 높이를 입력하세요")
        userInputInt()
        var isoverOne = self.isoverOne()
        while !(isoverOne) {
            print("최소 사다리 높이는 2입니다, 사다리 높이를 다시 입력해주세요")
            userInputInt()
            isoverOne = self.isoverOne()
        }
    }
    
    mutating func LadderGameBasicValueInitMember()->Array<Int>{
        playerNumber()
        let playerNumber = self.playerNumber()
        ladderHeight()
        let ladderHeight = self.ladderHeight()
        return [playerNumber,ladderHeight]
    }
}

//struct Input {
//    func playInput()->LadderGameBasicValue{
//        let initMamber = InputMamber()
//        let members = initMamber.LadderGameBasicValueInitMember
//        let ladderGameBasicValue = LadderGameBasicValue(members())
//        return ladderGameBasicValue
//    }
//}



