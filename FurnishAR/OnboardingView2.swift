import SwiftUI

struct OnboardingView2: View {
    var body: some View {
        
            VStack {
                // Navigation back button at the top
                HStack {
                    Button(action: {
                        // Handle back navigation
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white) // Background color of the circle
                                .frame(width: 45, height: 45) // Size of the circle
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                /*.foregroundColor(.black)*/ // Color of the arrow
                        }
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
                            .fill(Color.gray)
                            .frame(width: 8, height: 8)
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 8, height: 8)
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 8, height: 8)
                    }
                    
                    Spacer()
                    
                    // Next button with NavigationLink to SignInView
                    NavigationLink(destination: OnboardingView3()) {
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
            .background(Color(hex: "#F5F5F5"))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            // Hides the default navigation bar
        
    }
}

#Preview {
    OnboardingView2()
}
