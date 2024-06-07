import Foundation

struct Location: Identifiable, Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

struct LocationResponse: Decodable {
    let results: [Location]
}
