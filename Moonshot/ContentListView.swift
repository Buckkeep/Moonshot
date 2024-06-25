//
//  ContentListView.swift
//  Moonshot
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 25/06/2024.
//

import SwiftUI

struct ContentListView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] =
    Bundle.main.decode("missions.json")
    
    
    var body: some View {
            ForEach(missions) {mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                            
                        }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                    )
                }
            }
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    ContentListView()
}
