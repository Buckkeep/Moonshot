//
//  MixedView.swift
//  Moonshot
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 25/06/2024.
//

import SwiftUI

struct MixedView: View {
    
    @Binding var shouldShowGrid: Bool
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] =
    Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    private var lazyGridView: some View {
        LazyVGrid(columns: columns) {
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
        }
    }
    
    private var listView: some View {
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
    }
    
    @ViewBuilder
    private var preferredView: some View {
        if shouldShowGrid {
            lazyGridView
        } else {
            listView
        }
    }
    var body: some View {
        preferredView
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    ContentGridView()
}

