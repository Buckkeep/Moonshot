//
//  DividerView.swift
//  Moonshot
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 25/06/2024.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
}
