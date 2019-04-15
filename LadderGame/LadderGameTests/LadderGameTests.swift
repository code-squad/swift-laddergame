//
//  LadderGameTests.swift
//  LadderGameTests
//
//  Created by 김성현 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTests: XCTestCase {
    var height: Int!
    var numberOfPlayers: Int!
    var maxLength: Int!
    
    override func setUp() {
        height = 10
        numberOfPlayers = 10
        maxLength = 10
    }

    override func tearDown() {

    }
    
    
    func testRungsNotPlacedInSuccession() {
        
        // When
        let ladder = try! Ladder(numberOfPlayers: numberOfPlayers, height: height)
        
        // Then
        for row in ladder.info {
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
        let numberOfPlayers = [-5, 0, 1]
        
        // Then
        for number in numberOfPlayers {
            XCTAssertThrowsError(try Ladder(numberOfPlayers: number, height: height))
        }
        
        
    }
    
    func testInvalidLadderHeight() {
        
        // Given
        let heightsMustFail = [0, -1, -5]
        
        // Then
        for height in heightsMustFail {
            XCTAssertThrowsError(try Ladder(numberOfPlayers: numberOfPlayers, height: height))
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
