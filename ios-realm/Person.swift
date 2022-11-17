//
//  Person.swift
//  ios-realm
//
//  Created by Angelica dos Santos on 17/11/22.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var age: Int = 0
}
