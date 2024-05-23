//
//  ContentView.swift
//  Moonshot
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 23/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] =
    Bundle.main.decode("missions.json")
    
    var body: some View {
        Text(String(astronauts.count))
        Text(String(missions.count))
    }
}

#Preview {
    ContentView()
}
