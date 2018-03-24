//
//  RepeatingChecker.swift
//  LadderGame
//
//  Created by moon on 2018. 3. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

struct RepeatingChecker {
    
    func removeRepeatLadder(origin ladder: [[LadderStep]]) -> [[LadderStep]] {
        var removedLadder = ladder
        
        for row in 0..<ladder.count {
            removedLadder[row] = changeRow(ladder[row])
        }
        
        return removedLadder
    }
    
    func changeRow(_ row: [LadderStep]) -> [LadderStep] {
        var flag = false
        var changedRow = row
        
        for index in 0..<row.count {
            changedRow[index].step = (flag && row[index].step) ? !changedRow[index].step : changedRow[index].step
            flag = changedRow[index].step
        }
        
        return changedRow
    }
    
    
}
