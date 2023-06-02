//
//  File.swift
//  
//
//  Created by Stvya Sharma on 18/01/23.
//

import SwiftUI

struct ScoreRow: View {
    @Binding var item: Score

    var body: some View {
        HStack(spacing: 10) {
            Button {
                item.score -= 1
            } label: {
                Image(systemName: "minus")
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }

            TextField("Player name", text: $item.playerName)
                .minimumScaleFactor(0.5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .submitLabel(.done)

            Text(String(item.score))

            Button {
                item.score += 1
            } label: {
                Image(systemName: "plus")
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }
        }.background(.regularMaterial).cornerRadius(10)
        .padding(10)
        .animation(nil, value: item)
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets(top: 0, leading: 7.5, bottom: 0, trailing: 7.5))
        .accessibilityElement()
        .accessibilityLabel(item.playerName)
        .accessibilityValue(String(item.score))
        .accessibilityHint("Activate to rename this player.")
        .accessibilityAddTraits(.isButton)
        .accessibilityAdjustableAction { direction in
            if direction == .increment {
                item.score += 1
            } else {
                item.score -= 1
            }
        }
    }
}

struct ScoreRow_Previews: PreviewProvider {
    static var previews: some View {
        ScoreRow(item: .constant(.example))
    }
}

