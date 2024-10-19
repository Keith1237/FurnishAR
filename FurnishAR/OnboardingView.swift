import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Top Bar with Back Button
                    HStack {
                        Button(action: {
                            // Add an action here if needed for the back button
                        }) {
                            Image(systemName: "arrow.left")
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.top, 50) // Adjust the top padding to fit the status bar

                    
                    // Main content
                    Text("Welcome To Your Virtual Home Makeover!")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Image with proper fit inside the circle
                    Image("onboard1") // Replace with your actual image name
                        .resizable()
                        .scaledToFill() // Scales the image to fill the frame
                        .frame(width: 300, height: 300) // Set size for the image
                        .clipShape(Circle()) // Clip the image to a circle
                        .overlay(Circle().stroke(Color.blue, lineWidth: 4)) // Add a blue border around the circle
                        .shadow(radius: 7) // Add a shadow for a nicer effect

                    Text("Visualize Furniture In Your Space Using Augmented Reality. Browse, Place, And Design Your Dream Home Effortlessly.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Spacer()

                    // Page indicator and navigation buttons
                    HStack {
                        Button("Skip") {
                            // Action for Skip
                        }
                        Spacer()
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
            .navigationBarHidden(true) // Hide the default navigation bar for a custom one
        }
    }
}

#Preview {
    OnboardingView()
}
