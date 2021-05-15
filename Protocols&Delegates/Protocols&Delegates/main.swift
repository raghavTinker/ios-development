protocol AdvancedLifeSupport{
    func performCPR()
}

class EmergencyCallHandler{
    var delegate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport{
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    func performCPR() {
        print("I perform a CPR")
    }
}

class Doctor: AdvancedLifeSupport{
    func performCPR() {
        print("the doctor does chest compression")
    }
    
    func useStethoscope(){
        print("Listen to heart beat")
    }
}

let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)
emilio.assessSituation()
emilio.medicalEmergency()
