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
    
    func testPlayerNameNomalization(){
        let filterdPlayer = self.players.filter{
            player in
            return player.getName().count == 6
        }
        XCTAssertEqual(players.count,filterdPlayer.count,"이름이 6글자로 규격화 되었습니다.")
    }
    
    
    func testGetRandomSteps(){
        let exist = StepType.exist
        
        XCTAssertNotEqual(exist.generateAfter(), StepType.exist, "기존에 발판이 존재하면 빈 발판을 반환하지 않습니다.")
    }

}
