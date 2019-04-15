//
//  LadderGameTests.swift
//  LadderGameTests
//
//  Created by 김성현 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTests: XCTestCase {

    func testRungsNotPlacedInSuccession() {
        
        var nameOfPlayers: [String] = []
        for playerIndex in 1...10 {
            nameOfPlayers.append("Player\(playerIndex)")
        }
        let players = nameOfPlayers.map { Player(name: $0) }
        let ladderGame = LadderGame(players: players, height: 10)
        
        for row in ladderGame.ladder.info {
            var rungSuccessionCount = 0
            for item in row {
                if item == Ladder.Component.rung {
                    rungSuccessionCount += 1
                } else {
                    rungSuccessionCount = 0
                }
                XCTAssertTrue(rungSuccessionCount < 2)
            }
        }
        
    }
    
    func testAligning() {
        // Given
        let maxLength = 10
        let apple = "apple"
        let google = "google"
        let microsoft = "microsoft"
        
        // When
        let alignedApple = apple.alignedToCenter(length: maxLength)
        let alignedGoogle = google.alignedToCenter(length: maxLength)
        let alignedMicrosoft = microsoft.alignedToCenter(length: maxLength)
        
        // Then
        XCTAssertEqual(alignedApple, "  apple   ")
        XCTAssertEqual(alignedGoogle, "  google  ")
        XCTAssertEqual(alignedMicrosoft, "microsoft ")
        
    }
    
    
    
    
    

}
