//
//  ContentView.swift
//  Moonshot
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 23/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGrid = true
    
    @ViewBuilder
    private var ViewPreference: some View {
            if isGrid {
                ContentGridView()
            } else {
                ContentListView()
            }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ViewPreference
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                  isGrid.toggle()
                } label: {
                    isGrid ? Text("List View") : Text("Grid View")
                }
            }
        }
    }
    

}

#Preview {
    ContentView()
}
