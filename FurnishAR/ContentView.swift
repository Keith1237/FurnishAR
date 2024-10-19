import SwiftUI

struct ContentView: View {
    // State variable to trigger navigation
    @State private var isNavigating = false
    
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

                // Overlay a full-screen invisible button
                Button(action: {
                    // Action to navigate
                    navigateToOnboarding()
                }) {
                    Color.clear // Invisible overlay that covers the entire screen
                        .contentShape(Rectangle()) // Ensure it's tappable
                }
                .buttonStyle(PlainButtonStyle()) // Disable default button styling
                
                // NavigationLink that gets triggered when `isNavigating` is true
                NavigationLink(destination: OnboardingView(), isActive: $isNavigating) {
                    EmptyView() // Empty view, navigation is triggered by state
                }
            }
        }
    }
    
    // Navigation action
    func navigateToOnboarding() {
        // Trigger the navigation
        isNavigating = true
    }
}

#Preview {
    ContentView()
}
