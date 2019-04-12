struct CommandLineController {
    
    func askUserAndReadNumber(question: String) throws -> Int {
        print(question)
        guard let numberEnterd = Int(readLine()!) else {
            throw InputError.notNumber
        }
        return numberEnterd
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
    
    
    func readParticipants(numberOfParticipants: Int) throws -> [String] {
        var participants: [String] = []
        for _ in 1...numberOfParticipants {
            let participant = readLine()!
            guard participant.count <= 5 else {
                throw InputError.invalidParticipantName
            }
            participants.append(participant)
        }
        return participants
    }
    
    
    
    
    
    
    
    
}
