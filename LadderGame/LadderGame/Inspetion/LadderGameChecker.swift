//
//  LadderGameChecker.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 4. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

struct LadderGameChecker {
    
    static func continuous(_ ladderConnectForm: Array<Array<Bool>>) -> Bool {
        for ladderConnectLine in ladderConnectForm {
            guard notCotinuousChecker(ladderConnectLine) else {
                return false
            }
        }
        return true
    }
    
    static private func notCotinuousChecker(_ ladderConnectLine: Array<Bool>) -> Bool {
        guard !ladderNotCheckCount(ladderConnectLine.count) else {
            return true
        }
        return ladderConnectLine.count == 2 ? twoRopeChecker(ladderConnectLine) : contiuniousChecker(ladderConnectLine)
    }
    
    static private func ladderNotCheckCount(_ connectCount: Int) -> Bool {
       
        guard connectCount != 1 else {
            return true
        }
        
        guard connectCount >= 2 else {
            return true
        }
        return false
    }
    
    static private func contiuniousChecker(_ ladderConnectLine: Array<Bool>) -> Bool {
        for index in 0 ... (ladderConnectLine.count - 2) {
            guard ladderConnectLine[index] == ladderConnectLine[index + 1] && ladderConnectLine[index] else {
                return false
            }
        }
        return true
    }
    
    static private func twoRopeChecker(_ ladderConnectLine: Array<Bool>) -> Bool {
        guard ladderConnectLine[0] == ladderConnectLine[1] && ladderConnectLine[0] else {
            return true
        }
        return false
    }
}
