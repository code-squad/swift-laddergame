//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func startLadderGame() {
  
  guard let ladderInfo = enterUserInput() else {
    return
  }
  
  var ladder = createEmptyLadderBy(ladderInfo: ladderInfo)
  ladder = buildLadder(ladder: ladder)
  
  draw(ladder: ladder)
  
}

func createEmptyLadderBy(ladderInfo: (person: Int?, height: Int?)) -> [[Bool]] {
  
  guard let person = ladderInfo.person, let ladderHeight = ladderInfo.height else {
    return [[]]
  }
  let ladderWidth = person * 2 - 1
  
  let emptyLadder = Array(repeating: Array(repeating: false, count: ladderWidth), count: ladderHeight)
  
  return emptyLadder
}

func buildLadder(ladder: [[Bool]]) -> [[Bool]] {
  var ladder = ladder
  
  for (floorNum, floor) in ladder.enumerated() {
    for ladderLine in 0..<floor.count {
      if isVerticalLine(ladderLine) {
        ladder[floorNum][ladderLine] = true
      } else {
        ladder[floorNum][ladderLine] = isRandomStep() ? true : false
      }
    }
  }
  
  return ladder
}

func isRandomStep() -> Bool {
  let randomStep = Bool.random()
  return randomStep
}

func isVerticalLine(_ line: Int) -> Bool {
  if line % 2 == 0 {
    return true
  } else {
    return false
  }
}

func draw(ladder: [[Bool]]) {
  for (floorNum, floor) in ladder.enumerated() {
    for ladderLine in 0..<floor.count {
      if isVerticalLine(ladderLine) && ladder[floorNum][ladderLine] {
          print("|", terminator: "")
      } else {
       ladder[floorNum][ladderLine] ? print("-", terminator: "") : print(" ", terminator: "")
      }
    }
    print("")
  }
}

enum UserInputError: Error {
  case incorrectFormat(part: String)
  case emptyValue
  case negativeValue
}

///사용자의 입력을 받는다.
func enterUserInput() -> (person: Int?, height: Int?)? {
  
  print("참여할 사람은 몇 명인가요? (ex: 3)")
  guard let person = try? getCheckedInput() else {
    return nil
  }
  
  print("최대 사다리의 높이는 무엇인가요? (ex: 5)")
  guard let height = try? getCheckedInput() else {
    return nil
  }
  
  return (person, height)
}

///사용자의 입력을 읽어온다
func readUserInput() throws -> Int {
  
  let prompt = readLine()
  
  guard let response = prompt else {
    throw UserInputError.emptyValue
  }
  
  if let ladderInfo = Int(response.trimmingCharacters(in: CharacterSet.whitespaces)) {
    if ladderInfo < 0 {
      throw UserInputError.negativeValue
    } else {
      return ladderInfo
    }
  } else {
    throw UserInputError.incorrectFormat(part: response)
  }
}

///사용자의 입력을 검사한다.
func getCheckedInput() throws -> Int? {
  
  var input: Int?
  
  do {
    input = try readUserInput()
  } catch UserInputError.emptyValue {
    print("입력값이 없습니다.")
    startLadderGame()
  } catch UserInputError.negativeValue {
    print("음수값은 입력할 수 없습니다.")
    startLadderGame()
  } catch UserInputError.incorrectFormat(part: let part) {
    print("입력값: \(part)가 잘못 입력되었습니다.")
    startLadderGame()
  }
  
  return input
}

startLadderGame()


