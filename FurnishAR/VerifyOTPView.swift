import SwiftUI

struct VerifyOTPView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var otpDigits: [String] = Array(repeating: "", count: 5)
    @State private var isNavigatingToChangeNewPassword = false // Five empty strings for OTP digits
    
    var body: some View {
        NavigationView{
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
                    
                    // Left-aligned "Verify OTP" text
                    Text("Forgot Password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 60)
                        .padding(.leading,0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Verify OTP")
                        .font(.headline)
                        .padding(.top, 30) // Adjust the spacing as needed
                    
                    // Full-Width OTP Input Fields with Spacers
                    HStack(spacing: 10) {
                        Spacer() // Adds spacing on the left
                        ForEach(0..<5, id: \.self) { index in
                            TextField("", text: $otpDigits[index])
                                .keyboardType(.numberPad)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity) // Make each box take equal width
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                .multilineTextAlignment(.center)
                                .onChange(of: otpDigits[index]) { newValue in
                                    if newValue.count > 1 {
                                        otpDigits[index] = String(newValue.prefix(1)) // Keep only the first character
                                    }
                                    if newValue.count == 1, index < 4 {
                                        // Move to the next field automatically
                                        withAnimation {
                                            // Focus on the next field if required
                                        }
                                    }
                                }
                        }
                        Spacer() // Adds spacing on the right
                    }
                    .padding(.top, 30)
                    
                    NavigationLink(destination: ChangeNewPasswordView(), isActive: $isNavigatingToChangeNewPassword) {
                        EmptyView()
                    }
                    
                    // Submit Button
                    Button(action: {
                        // Action for OTP verification
                        isNavigatingToChangeNewPassword = true
                        let enteredOTP = otpDigits.joined()
                        print("Entered OTP: \(enteredOTP)")
                    }) {
                        Text("Verify OTP")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(.top, 20)
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

// Preview for Verify OTP View
struct VerifyOTPView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyOTPView()
    }
}
