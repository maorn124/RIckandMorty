import SwiftUI

struct LocationDetailView: View {
    let location: Location

    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(location.name)")
                .font(.title)
            Text("Type: \(location.type)")
            Text("Dimension: \(location.dimension)")
            Text("Created: \(location.created)")
                .padding(.top)
            Spacer()
        }
        .padding()
        .navigationTitle(location.name)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleLocation = Location(id: 1, name: "Earth", type: "Planet", dimension: "Dimension C-137", residents: [], url: "", created: "2017-11-10T12:42:04.162Z")
        LocationDetailView(location: sampleLocation)
    }
}
