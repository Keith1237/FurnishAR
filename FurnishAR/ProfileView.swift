import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode // Access presentation mode to handle back navigation
    
    var body: some View {
        NavigationView {
            VStack {
                // Back Button and Centered Title
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Dismisses the view to go back
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 45, height: 45)
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    // Centered Profile Title
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer() // Keeps title centered with back button
                    
                    // Invisible button to balance the layout
                    Button(action: {}) {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 45, height: 45)
                    }
                }
                .padding([.leading, .trailing, .top], 20)
                
                Spacer()
                
                // Profile Image, Name, and Email
                VStack(spacing: 8) {
                    Image("profile_icon") // Replace with actual image name
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .padding(.top, 10)
                    
                    Text("Keith Praveen")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("keithpraveen23@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 30)
                
                // Options List
                VStack(spacing: 15) {
                    ProfileOptionRow(icon: "bell", text: "Notifications")
                    ProfileOptionRow(icon: "creditcard", text: "Payment Methods")
                    
                    // NavigationLink to MyOrdersView for Order History
                    NavigationLink(destination: MyOrdersView()) {
                        ProfileOptionRow(icon: "clock.arrow.circlepath", text: "Order History")
                    }
                    
                    ProfileOptionRow(icon: "house", text: "Delivery Address")
                    ProfileOptionRow(icon: "gearshape", text: "Settings")
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Log Out Button
                Button(action: {
                    // Handle log out
                }) {
                    Text("Log Out")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding(.vertical, 10)
                }
                .padding(.bottom, 30)
            }
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationBarBackButtonHidden(true) // Hides the default back button
        }
    }
}

// Reusable row view for profile options
struct ProfileOptionRow: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.black)
            Text(text)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
