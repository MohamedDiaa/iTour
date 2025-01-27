//
//  ContentView.swift
//  iTour
//
//  Created by Mohamed Alwakil on 2025-01-27.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Query var destinations: [Destination]
    @Environment(\.modelContext) var modelContext

    var body: some View {

        NavigationStack {
            List {
                ForEach(destinations) { destination in
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)

                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }
    }

    func addSamples() {
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Florence")
        let naples = Destination(name: "Naples")

        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
}

#Preview {
    ContentView()
}
