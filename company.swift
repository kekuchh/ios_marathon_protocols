import Foundation

protocol WriteCode {
    var days: Int { get set }
    var code: Int { get set }
    
    func writeCode()
}

protocol StopCoding {
    func stopCoding()
}

enum Platform {
    case Ios, Android, Web
}

class Company: WriteCode, StopCoding {
    var days: Int
    var code: Int
    var developersNumber: Int
    var developers: [Int: Platform] = [:]
    
    init(days: Int, countCode: Int) {
        self.days = days
        self.code = countCode
        self.developersNumber = 0
    }

    func addDeveloper(specialization: Platform) {
        developersNumber += 1
        developers[developersNumber] = specialization
    }
    
    func writeCode() {
        print("Разработка начата - есть \(days) дней")
    }
    
    func stopCoding() {
        for (num, spec) in developers {
            print("Трудился номер \(num) над платформой \(spec)")
        }
        print("Разработка остановлена")
    }
}

let Google = Company(days: 21, countCode: 12345)

Google.addDeveloper(specialization: Platform.Ios)
Google.writeCode()
Google.stopCoding()
