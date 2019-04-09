//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func startLadderGame() {
  
  guard let inputValue = try? enterUserInput() else {
    return
  }
  
  let ladderWidth = inputValue.person * 2 - 1
  let ladderHeight = inputValue.height
  
  var rawLadder = Array(repeating: Array(repeating: false, count: ladderWidth), count: ladderHeight)
  
  //배열 초기화
  rawLadder = setData(of: rawLadder)
  convertVisualFrom(ladder: rawLadder, width: ladderWidth, height: ladderHeight)
  
}


func setData(of ladder: [[Bool]]) -> [[Bool]] {
  var ladder = ladder
  
  for (floorNum, floor) in ladder.enumerated() {
    for ladderLine in 0..<floor.count {
      if isVerticalLine(ladderLine) {
        ladder[floorNum][ladderLine] = true
      } else {
        let randomStep = makeRandomStep()
        if randomStep == 1 {
          ladder[floorNum][ladderLine] = true
        }
      }
    }
  }
  return ladder
}

func makeRandomStep() -> UInt32 {
  let randomStep = arc4random_uniform(2)
  return randomStep
}

func isVerticalLine(_ line: Int) -> Bool {
  if line % 2 == 0 {
    return true
  } else {
    return false
  }
}

func convertVisualFrom(ladder: [[Bool]], width: Int, height: Int) {
  var visualLadder = Array(repeating: Array(repeating: " ", count: width), count: height)
  
  for (floorNum, floor) in ladder.enumerated() {
    for ladderLine in 0..<floor.count {
      if ladder[floorNum][ladderLine] == true {
        visualLadder[floorNum][ladderLine] = isVerticalLine(ladderLine) ? "|" : "-"
      }
    }
  }
}

enum UserInputError: Error {
  case incorrectFormat(part: String)
  case emptyValue
  case negativeValue
}

func enterUserInput() throws -> (person: Int, height: Int) {
  var person: Int = 0
  var height: Int = 0
  
  print("참여할 사람은 몇 명인가요? (ex: 3)")
  person = try! getCheckedInput()
  
  print("최대 사다리의 높이는 무엇인가요? (ex: 5)")
  height = try! getCheckedInput()

  return (person, height)
}

func checkInput() throws -> Int {
  
  let prompt = readLine()
  
  guard let responsePerson = prompt else {
    throw UserInputError.emptyValue
  }
  
  if let person = Int(responsePerson.trimmingCharacters(in: CharacterSet.whitespaces)) {
    if person < 0 {
      throw UserInputError.negativeValue
    } else {
      return person
    }
  } else {
    throw UserInputError.incorrectFormat(part: responsePerson)
  }
}

func getCheckedInput() throws -> Int {
  
  var input: Int = 0
  
  do {
    input = try checkInput()
  } catch UserInputError.emptyValue {
    print("입력값이 없습니다.")
  } catch UserInputError.negativeValue {
    print("음수값은 입력할 수 없습니다.")
  } catch UserInputError.incorrectFormat(part: let part) {
    print("입력값: \(part)가 잘못 입력되었습니다.")
  }
  
  return input
}

startLadderGame()


