struct CommandLineController {
    
    private func ask(for question: String) -> String {
        print(question)
        return readLine()!
    }
    
    
    func readLadderInfo() throws -> (participants: [String.SubSequence], height: Int) {
        
        let participantsFromUser = ask(for: "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let participants = participantsFromUser.split(separator: ",")
        
        guard participants.count > 1 else {
            throw InputError.invalidNumberOfParticipants
        }
        
        for participant in participants {
            guard participant.count <= 5 else {
                throw InputError.invalidParticipantName
            }
        }
        
        let heightFromUser = ask(for: "사다리 높이는 몇 개인가요?")
        guard let height = Int(heightFromUser), height > 0 else {
            throw InputError.invalidLadderHeight
        }
        return (participants, height)
    }
    
    
    
    
    
    
    
    
    
    
}
