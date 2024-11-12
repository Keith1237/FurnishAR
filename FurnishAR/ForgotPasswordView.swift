import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email: String = ""
    @State private var isNavigatingToVerifyOTP = false // State variable to control navigation
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HStack {
                        // Back Button
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
                        
                        // Placeholder for symmetry on the right side
                        Button(action: {}) {
                            ZStack {
                                Circle()
                                    .fill(Color.clear)
                                    .frame(width: 45, height: 45)
                            }
                        }
                    }
                    .padding(.top, 60)
                    
                    // Left-aligned "Forgot Password" text
                    Text("Forgot Password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 60)
                        .padding(.leading, 0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Email Input Field
                    Text("Email")
                        .font(.headline)
                        .padding(.top, 30) // Adjust the spacing as needed
                    
                    TextField("Enter Your Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .padding(.top, 5)
                    
                    // NavigationLink to VerifyOTPView
                    NavigationLink(destination: VerifyOTPView(), isActive: $isNavigatingToVerifyOTP) {
                        EmptyView()
                    }
                    
                    // Submit Button
                    Button(action: {
                        // Action for password reset
                        
                        isNavigatingToVerifyOTP = true // Trigger navigation to VerifyOTPView
                    }) {
                        Text("Send OTP")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(.top, 20) // Adjust spacing as needed
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
            }
            .edgesIgnoringSafeArea(.top)
            .background(Color(.systemGray6))
            .navigationBarBackButtonHidden(true)
        }
    }
}

// Preview for Forgot Password View
struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
