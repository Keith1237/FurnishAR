import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            // Navigation back button at the top
            HStack {
                Button(action: {
                    // Handle back navigation
                }) {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .padding()
                }
                Spacer()
            }
            .padding(.horizontal)

            Spacer()

            // Main content with title and image
            Text("Welcome To Your Virtual Home Makeover!")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()

            Image("onboard1") // Replace with your image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .padding()

            Text("Visualize Furniture In Your Space Using Augmented Reality. Browse, Place, And Design Your Dream Home Effortlessly.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()

            // Bottom controls
            HStack {
                // Skip button
                Button(action: {
                    // Skip to next
                }) {
                    Text("Skip")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                Spacer()

                // Page Indicator
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 8, height: 8)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 8, height: 8)
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 8, height: 8)
                }
                
                Spacer()

                // Next button
                Button(action: {
                    // Move to next page
                }) {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .padding()
                }
            }
            .padding(.horizontal)
        }
        .navigationBarHidden(true) // Hides the default navigation bar
    }
}

#Preview {
    OnboardingView()
}
