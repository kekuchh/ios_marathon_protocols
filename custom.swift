import Foundation

protocol Animal {
    var name: String { get }
    var habitat: String? { get }
    
    func greeting()
}

class Cat: Animal {
    var name: String
    var habitat: String?

    init(name: String) {
        self.name = name
    }
    
    func greeting() {
        print("Привет меня зовут \(name)")
    }
}

let animal = Cat(name: "Муся")
animal.greeting()
