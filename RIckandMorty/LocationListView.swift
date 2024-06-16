import SwiftUI

struct LocationListView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = LocationViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.locations) { location in
                NavigationLink(destination: LocationDetailView(location: location)) {
                    Text(location.name)
                }
            }
            .navigationBarTitle("Locations")
            .navigationBarItems(trailing: Button(action: {
                authViewModel.signOut()
            }) {
                Text("Logout")
                    .foregroundColor(.red)
            })
        }
        .onAppear {
            viewModel.fetchLocations()
        }
    }
}
