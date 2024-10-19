import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("newImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: 10) // Apply blur effect to the image
                
                // Centered Text
                Text("FurnishAR")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                // Full Screen Navigation Link
                NavigationLink(destination: OnboardingView()) {
                    Color.clear // Invisible overlay that covers the entire screen
                }
                .buttonStyle(PlainButtonStyle()) // Disable button styling effects
            }
        }
    }
}

#Preview {
    ContentView()
}
