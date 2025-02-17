//Protocol and delegates demo by Angela Yu. Lecture 147.

protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    
    var delegate: AdvancedLifeSupport?
    
    func analyzeSituation() {
        print("Ask probing questions")
    }
    
    func declareEmergency() {
        delegate?.performCPR()
    }
    
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The Paramedic performs CPR")
    }
    
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The Doctor performs CPR")
    }
    
}

class Surgeon: Doctor {
    
    override func performCPR() {
        print("The Surgeon performs CPR ")
    }
}

let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)

emilio.analyzeSituation()
emilio.declareEmergency()

