//
//  ContentView.swift
//  Moonshot
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 23/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var shouldShowGrid = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                MixedView(shouldShowGrid: $shouldShowGrid)
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                  shouldShowGrid.toggle()
                } label: {
                    shouldShowGrid ? Text("List View") : Text("Grid View")
                }
            }
        }
    }
    
}

#Preview {
    ContentView(shouldShowGrid: true)
}
