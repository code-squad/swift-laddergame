//
//  InputController.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

func userCountInput() throws -> Int{
    
    print(LADDERGAME_PARTICIPATION_COUNT_MESSAGE)
    
    guard let usercountStringValue = readLine() else {
        throw LadderGameError.isEmptyError
    }
    guard let userCountIntValue = Int(usercountStringValue) else {
        throw LadderGameError.convertError
    }
    
    guard !(userCountIntValue < 0) else {
        throw LadderGameError.minusError
    }
    
    guard !(userCountIntValue == 0) else {
        throw LadderGameError.zeroError
    }
    
    return userCountIntValue
}

func ladderHeightInput() throws -> Int {
    
    print(LADDERGAME_HEIGHT_COUNT_MESSAGE)
    
    guard let ladderHeightStringValue = readLine() else {
         throw LadderGameError.isEmptyError
    }
    
    guard let ladderHeightIntValue = Int(ladderHeightStringValue) else {
        throw LadderGameError.convertError
    }
    
    guard !(ladderHeightIntValue < 0) else {
        throw LadderGameError.minusError
    }
    
    guard !(ladderHeightIntValue == 0) else {
        throw LadderGameError.zeroError
    }
    return ladderHeightIntValue
}
