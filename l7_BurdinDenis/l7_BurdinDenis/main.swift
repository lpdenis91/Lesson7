//
//  main.swift
//  l7_BurdinDenis
//
//  Created by u on 15.01.2021.
//

import Foundation

enum FactoryError: Error {
    case notFound(text: String)
    case employesIsEmpty
}

class Factory {
    var employes: [String: Double] = [:
//        "Иванов": 12.0,
//        "Петров": 4.0,
//        "Сидоров": 0.5
    ]
    
    func workExp(fio: String) -> (Double?, FactoryError?) {
        guard employes.count != 0 else {
            return (nil, FactoryError.employesIsEmpty)
        }
        guard (employes[fio] != nil) else {
            return (nil, FactoryError.notFound(text: fio))
        }
        
        return (employes[fio], nil)
    }
}

let factory = Factory()
let factoryEmployeeWorkExp = factory.workExp(fio: "Семенов")
if let workExp = factoryEmployeeWorkExp.0 {
    print(workExp)
} else if let error = factoryEmployeeWorkExp.1 {
    print(error.localizedDescription)
}



//2 Задание
enum CompanyError: Error {
    case notFound(text: String)
    case employesIsEmpty
}

class Company {
    var employes: [String: Double] = [
        "Иванов": 12.0,
        "Петров": 4.0,
        "Сидоров": 0.5
    ]
    
    func workExp(fio: String) throws -> Double? {
        guard employes.count != 0 else {
            throw CompanyError.employesIsEmpty
        }
        guard (employes[fio] != nil) else {
            throw CompanyError.notFound(text: fio)
        }
        
        return employes[fio]
    }
}

do {
    let company = Company()
    let employeeWorkExp = try company.workExp(fio: "Семенов")
    print(employeeWorkExp)
} catch CompanyError.notFound(let text) {
    print("Сотрудник \(text) не найден")
} catch CompanyError.employesIsEmpty {
    print("В компании нет сотрудников")
}
