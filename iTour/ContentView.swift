//
//  ContentView.swift
//  iTour
//
//  Created by Mohamed Alwakil on 2025-01-27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var path = [Destination]()
    
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder = SortDescriptor(\Destination.name)

    @State private var searchText = ""

    var body: some View {
        
        NavigationStack(path: $path) {
            
            DestinationListingView(sort: sortOrder, searchString: searchText)
                .toolbar {
                    Button("Add Destination", systemImage: "plus", action: addDestination)

                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Destination.name))

                            Text("Priority")
                                .tag(SortDescriptor(\Destination.priority, order: .reverse))

                            Text("Date")
                                .tag(SortDescriptor(\Destination.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
                .navigationTitle("iTour")
                .searchable(text: $searchText)
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            
        }
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
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
