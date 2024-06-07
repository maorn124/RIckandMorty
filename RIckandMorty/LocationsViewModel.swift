import Foundation
import Combine

class LocationsViewModel: ObservableObject {
    @Published var locations = [Location]()
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchLocations()
    }

    func fetchLocations() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: LocationResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching locations: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { response in
                self.locations = response.results
            })
            .store(in: &self.cancellables)
    }
}
