import Foundation


enum InputError: Error {
    case invalidInput
    case invalidNumberOfParticipants
    case invalidLadderHeight
}

func readLadderInfo() throws -> (numberOfParticipants: Int, height: Int) {
    let numberOfParticipants = try askUserAndReadNumber(question: "참여할 사람은 몇 명 인가요?")
    guard numberOfParticipants > 1 else {
        throw InputError.invalidNumberOfParticipants
    }
    let height = try askUserAndReadNumber(question: "사다리 높이는 몇 개인가요?")
    guard height > 0 else {
        throw InputError.invalidLadderHeight
    }
    return (numberOfParticipants, height)
}


func askUserAndReadNumber(question: String) throws -> Int {
    print(question)
    guard let numberEnterd = Int(readLine()!) else {
        throw InputError.invalidInput
    }
    return numberEnterd
}


func runLadderGame() throws {
    let ladderInfo = try readLadderInfo()
    
}


do {
    try runLadderGame()
} catch InputError.invalidInput {
    print("오류: 유효하지 않은 입력")
} catch InputError.invalidNumberOfParticipants {
    print("오류: 유효하지 않은 참여자 수")
} catch InputError.invalidLadderHeight {
    print("오류: 유효하지 않은 사다리 높이")
} catch {
    print("예상치 못한 오류: \(error)")
}

