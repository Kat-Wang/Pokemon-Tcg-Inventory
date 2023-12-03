import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Your content goes here")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {
                            // Add action for leading button
                        }) {
                            Image(systemName: "gear")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Add action for trailing button
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .navigationBarTitle("Title", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
