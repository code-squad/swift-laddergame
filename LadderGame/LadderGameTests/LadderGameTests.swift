//
//  LadderGameTests.swift
//  LadderGameTests
//
//  Created by 김성현 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTests: XCTestCase {
    var players: [Player]!
    
    override func setUp() {
        super.setUp()
        players = [
            Player(name: "apple"),
            Player(name: "google"),
            Player(name: "microsoft"),
            Player(name: "samsung")
        ]
        
    }
    
    override func tearDown() {
        
    }
    
    
    func testRungsNotPlacedInSuccession() {
        
        // Given
        let height = 10
        
        // When
        let ladderGame = try! LadderGame(players: players, height: height)
        
        // Then
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
        let nameOfPlayers = ["apple", "google", "microsoft", "samsung"]
        
        // When
        let alignedNames = nameOfPlayers.map { $0.alignedToCenter(length: maxLength) }
        
        // Then
        XCTAssertEqual(alignedNames[0], "  apple   ")
        XCTAssertEqual(alignedNames[1], "  google  ")
        XCTAssertEqual(alignedNames[2], "microsoft ")
        XCTAssertEqual(alignedNames[3], " samsung  ")
        
        
    }
    
    func testLadderPrinting() {
        // Given
        let ladderRow = [
            Ladder.Component.empty,
            .rung,
            .empty,
            .rung,
            .empty,
            .rung,
            .empty,
            .rung,
            .empty,
            .empty
        ]
        
        // When
        let printedRow = ladderRow.stringized(maxNameLength: 1)
        
        // Then
        XCTAssertEqual(printedRow, " |-| |-| |-| |-| | ")
    }
    
    func testInvalidNumberOfPlayers() {
        
        // Given
        let players = [Player(name: "apple")]
        
        // Then
        XCTAssertThrowsError(try LadderGame(players: players, height: 1))
        
    }
    
    func testInvalidLadderHeight() {
        
        // Given
        let heightsMustFail = [0, -1, -5]
        
        // Then
        for height in heightsMustFail {
            XCTAssertThrowsError(try LadderGame(players: players, height: height))
        }
        
    }
    
    func testLadderGameResult() {
        // Given
        let players = [
            Player(name: "player1"),
            Player(name: "player2"),
            Player(name: "player3"),
            Player(name: "player4"),
            Player(name: "player5"),
            Player(name: "player6")
        ]
        let info = [
            [Ladder.Component.empty, .rung, .empty, .rung, .empty, .empty, .empty],
            [Ladder.Component.empty, .empty, .rung, .empty, .rung, .empty, .empty],
            [Ladder.Component.empty, .rung, .empty, .empty, .rung, .empty, .empty],
            [Ladder.Component.empty, .rung, .empty, .rung, .empty, .rung, .empty]
        ]
        let ladder = Ladder(info: info)
        let ladderGame = LadderGame(players: players, ladder: ladder)
        
        // When
        let gameResults = ladderGame.results()
        
        // Then
        let results = [
            Player(name: "player2"),
            Player(name: "player4"),
            Player(name: "player3"),
            Player(name: "player1"),
            Player(name: "player6"),
            Player(name: "player5")
        ]
        XCTAssertEqual(gameResults.map { $0.name }, results.map { $0.name })
        
    }
    
}
