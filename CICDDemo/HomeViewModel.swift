//
//  ContentView.swift
//  CICDDemo
//
//  Created by Cristian Chertes on 27.06.2025.
//

import Foundation
import SwiftData

@MainActor
class HomeViewModel: ObservableObject {
    @Published var items: [Item] = []
    private var modelContext: ModelContext?
    
    func setModelContext(_ context: ModelContext) {
        self.modelContext = context
        fetchItems()
    }
    
    func fetchItems() {
        guard let context = modelContext else { return }
        let descriptor = FetchDescriptor<Item>()
        if let fetched = try? context.fetch(descriptor) {
            self.items = fetched
        }
    }
    
    func addItem() {
        guard let context = modelContext else { return }
        let newItem = Item(timestamp: Date())
        context.insert(newItem)
        fetchItems()
    }
    
    func deleteItems(at offsets: IndexSet) {
        guard let context = modelContext else { return }
        for index in offsets {
            let item = items[index]
            context.delete(item)
        }
        fetchItems()
    }
}
