import Foundation
import Combine

class LocationViewModel: ObservableObject {
    @Published var locations = [Location]()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchLocations() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: LocationResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] locations in
                self?.locations = locations
            })
            .store(in: &cancellables)
    }
}
