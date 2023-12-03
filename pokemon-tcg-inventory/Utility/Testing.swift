import SwiftUI

struct ContentView: View {
    @State private var isAnimated = false

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .scaleEffect(isAnimated ? 1.5 : 1) // Scales the rectangle on animation
                .animation(.easeInOut(duration: 1)) // Animates the changes

            Button("Animate") {
                withAnimation {
                    self.isAnimated.toggle()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
