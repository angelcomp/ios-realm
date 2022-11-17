//
//  ViewController.swift
//  ios-realm
//
//  Created by Angelica dos Santos on 17/11/22.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        save(firstName: "Angelica", lastName: "Santos", age: 22)
        save(firstName: "Maria", lastName: "Silva", age: 36)
        save(firstName: "José", lastName: "Oliveira", age: 27)
    }
    
    private func save(firstName: String, lastName: String, age: Int) {
        let person = Person()
        person.firstName = firstName
        person.lastName = lastName
        person.age = age
        
        realm.beginWrite()
        realm.add(person)
        try! realm.commitWrite()
    }
}

