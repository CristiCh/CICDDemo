//
//  ContentView.swift
//  CICDDemo
//
//  Created by Cristian Chertes on 27.06.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(viewModel.items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: viewModel.deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: viewModel.addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .onAppear {
            viewModel.setModelContext(modelContext)
        }
    }
}
