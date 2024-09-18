import UIKit


protocol Observer {
    var id: Int {get}
    func notify(data: String)
}

protocol Subject {
    var observers: [Observer] {get set}
    var mobile: String {get set}
    func addObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyAll()
}

class Person: Subject {
    var observers: [Observer] = []
    var mobile: String {
        didSet {
            notifyAll()
        }
    }
    var name: String
    
    init(mobile: String, name: String) {
        self.mobile = mobile
        self.name = name
    }
    
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        for (index, object) in observers.enumerated() {
            if object.id == observer.id {
                observers.remove(at: index)
            }
        }
    }
    
    func notifyAll() {
        for observer in observers {
            observer.notify(data: mobile)
        }
    }
    
    
    
}


class FamilyMember: Observer {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func notify(data: String) {
        print("New Mobile number is: \(data)")
    }
    
    
}

var person: Subject = Person(mobile: "1234567890", name: "ABC")
let familyMember1: Observer = FamilyMember(id: 1, name: "aa")
let familyMember2: Observer = FamilyMember(id: 2, name: "bb")
let familyMember3: Observer = FamilyMember(id: 3, name: "cc")

person.addObserver(observer: familyMember1)
person.addObserver(observer: familyMember2)
person.addObserver(observer: familyMember3)

person.removeObserver(observer: familyMember1)
person.mobile = "1224343333"


person.mobile = "88888888888"
