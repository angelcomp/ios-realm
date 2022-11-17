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
    
    private let label: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Helvetica", size: 30)
        element.textAlignment = .center
        element.numberOfLines = 0
        element.text = "People:"
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = view.bounds
        view.addSubview(label)
        
        delete()
        
        save(firstName: "Angelica", lastName: "Santos", age: 22)
        save(firstName: "Maria", lastName: "Silva", age: 36)
        save(firstName: "José", lastName: "Oliveira", age: 27)
        
        update()
        
        render()
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
    
    private func render() {
        let people = realm.objects(Person.self)
        var text = ""
        
        for person in people {
            text += "\n\(person.firstName) \(person.lastName) - \(person.age)"
        }
        
        label.text = text
    }
    
    private func delete() {
        realm.beginWrite()
        realm.delete(realm.objects(Person.self))
        try! realm.commitWrite()
    }
    
    private func update() {
        let angelica = realm.objects(Person.self).first!
        
        try! realm.write {
            angelica.firstName = "Andie"
            angelica.age += 1
        }
    }
}

