//
//  Destination.swift
//  iTour
//
//  Created by Mohamed Alwakil on 2025-01-27.
//
import SwiftUI
import SwiftData

@Model
class Destination {

    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule: .cascade) var sights = [Sight]()

    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
