import SwiftUI

struct LocationDetailView: View {
    var location: Location

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(location.name)
                .font(.largeTitle)
            Text(location.type)
                .font(.title)
            Text("Dimension: \(location.dimension)")
                .font(.subheadline)
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(location.name), displayMode: .inline)
    }
}
