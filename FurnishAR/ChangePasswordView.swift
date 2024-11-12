import SwiftUI

struct ChangePasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            // Back button and title
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
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
                
                Text("Change Password")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(alignment: .center)
                
                Spacer()
                
                // Empty button for alignment placeholder
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.clear)
                }
            }
            .padding([.leading, .trailing, .top], 20)
            
            // Current Password Field
            VStack(alignment: .leading, spacing: 5) {
                Text("Current Password")
                    .font(.headline)
                    .foregroundColor(.black)
                SecureField("Enter Your Password", text: $currentPassword)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            }
            
            // New Password Field
            VStack(alignment: .leading, spacing: 5) {
                Text("New Password")
                    .font(.headline)
                    .foregroundColor(.black)
                SecureField("Enter New Password", text: $newPassword)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            }
            
            // Confirm New Password Field
            VStack(alignment: .leading, spacing: 5) {
                Text("Confirm New Password")
                    .font(.headline)
                    .foregroundColor(.black)
                SecureField("Enter New Password", text: $confirmPassword)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            }
            
            // Change Password Button
            Button(action: {
                // Handle change password logic here
            }) {
                Text("Change Password")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
        .background(Color(.systemGray6))
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
