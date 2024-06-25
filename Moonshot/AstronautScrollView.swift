//
//  AstronautScrollView.swift
//  Moonshot
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 24/05/2024.
//

import SwiftUI

struct AstronautScrollView: View {
    
    
    let mission: Mission
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {

            VStack(alignment: .leading){
                Text("Crew")
                    .font(.title.bold())
                    .padding()
                
            HStack {
                ForEach(crew, id: \.role) {
                    crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.bottom)
    }
    
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
//    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautScrollView(mission: missions[3], crew: [])
        .preferredColorScheme(.dark)
}

