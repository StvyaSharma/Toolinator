//
//  File 2.swift
//  
//
//  Created by Stvya Sharma on 18/01/23.
//

import Combine
import Foundation

enum ColorChoice: String, Codable, CaseIterable {
    case blue, gray, green, indigo, orange, purple, red, teal
}


struct Score: Codable, Identifiable, Hashable {
    var id = UUID()
    var playerName = "New Player"
    var score = 0
    var color = ColorChoice.blue

    static let example = Score()
}


class ViewModel: ObservableObject {
    @Published var items: [Score]

    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedItems")

    private var saveSubscription: AnyCancellable?

    init() {
        do {
            let data = try Data(contentsOf: savePath)
            items = try JSONDecoder().decode([Score].self, from: data)
        } catch {
            items = []
        }

        saveSubscription = $items
            .debounce(for: 5, scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.save()
            }
    }

    func save() {
        print("Saving!")
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }

    func add() {
        let usedColors = items.map(\.color)
        let color = ColorChoice.allCases.first { usedColors.contains($0) == false } ?? .blue
        let newItem = Score(color: color)
        items.append(newItem)
        save()
    }

    func delete(_ offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    func deleteAll() {
        items.removeAll()
        save()
    }

    func reset() {
        for i in 0..<items.count {
            items[i].score = 0
        }
        save()
    }
}


import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
