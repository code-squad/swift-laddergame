//
//  LadderGameTests.swift
//  LadderGameTests
//
//  Created by 이동영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest


class LadderGameTests: XCTestCase {

    var players : [LadderPlayer] = [LadderPlayer]()
    var ladder : Ladder?
    var heightOfLadder : Int = 10
    
    override func setUp()  {
        do{
            players.append(try LadderPlayer.init(name: "Swift"))
            players.append(try LadderPlayer.init(name: "Java"))
            players.append(try LadderPlayer.init(name: "C++"))
            players.append(try LadderPlayer.init(name: "HTML"))
            ladder = Ladder.init(height: heightOfLadder, numOfSteps: players.count-1)
        }catch{
            
        }
    }

}
