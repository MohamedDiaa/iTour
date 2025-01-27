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
    @State private var path = [Destination]()

    @Environment(\.modelContext) var modelContext

    var body: some View {

        NavigationStack(path: $path) {
            List {
                ForEach(destinations) { destination in

                    NavigationLink(value: destination) {
                        VStack(alignment: .leading) {
                            Text(destination.name)
                                .font(.headline)

                            Text(destination.date.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteDestinations)

            }
            .toolbar {
                Button("Add Destination", systemImage: "plus", action: addDestination)
            }
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            
        }

    }


    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }


    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
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
