//
//  RepeatingChecker.swift
//  LadderGame
//
//  Created by moon on 2018. 3. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

struct RepeatingChecker {
    
    static func removeRepeatLadder(origin ladder: [[LadderStep]]) -> [[LadderStep]] {
        var nonRepeatLadder = ladder
        
        for row in ladder.indices {
            nonRepeatLadder[row] = self.changeRow(ladder[row])
        }
        
        return nonRepeatLadder
    }
    
    private static func changeRow(_ row: [LadderStep]) -> [LadderStep] {
        var flag = false
        var changedRow = row
        
        for index in row.indices {
            changedRow[index].step = (flag && row[index].step) ? !changedRow[index].step : changedRow[index].step
            flag = changedRow[index].step
        }
        
        return changedRow
    }
    
    
}
