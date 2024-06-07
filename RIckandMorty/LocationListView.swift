import SwiftUI

struct LocationListView: View {
    @ObservedObject var viewModel = LocationsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.locations) { location in
                NavigationLink(destination: LocationDetailView(location: location)) {
                    Text(location.name)
                }
            }
            .navigationTitle("Locations")
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
