//
//  SwiftUIView.swift
//  Moonshot
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 23/05/2024.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in width * 0.6
                    }
                
                Text("Mission Date: \(mission.formattedLaunchDate)")
                
                VStack(alignment: .leading) {
                    DividerView()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    DividerView()
                    
                }
                .padding(.horizontal)
                
                AstronautScrollView(mission: mission, crew: crew)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[3], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
