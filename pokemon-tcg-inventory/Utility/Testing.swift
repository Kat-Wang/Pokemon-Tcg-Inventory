import SwiftUI

struct MenuButton: View {
    let label: String
    var body: some View {
        Text(label)
            .foregroundColor(.white)
            .font(.system(size: 20))
            .padding(10)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .circular)
                    .fill(.blue)
            )
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: DetailsView(destinationNumber: 1)) {
                    MenuButton(label: "Multiple nested navigation")
                }.padding(.top, 60)
                Spacer()
            }.navigationTitle("Nested Navigation")
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
        }
    }
}

struct DetailsView: View {
    let destinationNumber: Int
    var body: some View {
        VStack {
            Text("Details View No: \(destinationNumber)")
                .font(.system(size: 24, weight: .black))
                .padding(.vertical, 50)
            NavigationLink(destination: DetailsView(destinationNumber: destinationNumber + 1)) {
                MenuButton(label: "Go to detail view no: \(destinationNumber + 1)")
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    ContentView()
}
