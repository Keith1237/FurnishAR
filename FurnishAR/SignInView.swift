import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Back Button
                    HStack {
                        Button(action: {
                            // Action for back button
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                                .padding()
                        }
                        Spacer()
                    }
                    
                    // Welcome Text
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text("Welcome Back! Please Enter Your Details.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    // Email Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.headline)
                            .foregroundColor(.gray)
                        TextField("Enter Your Email", text: $email)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    
                    // Password Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(.headline)
                            .foregroundColor(.gray)
                        SecureField("Enter Your Password", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    
                    // Remember Me & Forgot Password
                    HStack {
                        Toggle("Remember For 30 Days", isOn: $rememberMe)
                            .toggleStyle(CheckboxToggleStyle())
                            .font(.footnote)
                        
                        Spacer()
                        
                        Button(action: {
                            // Action for forgot password
                        }) {
                            Text("Forgot Password")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    // Sign In Button
                    Button(action: {
                        // Action for sign in
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    
                    // Sign In with Google Button
                    Button(action: {
                        // Action for Google sign in
                    }) {
                        HStack {
                            Image("google_icon") // Custom Google logo image
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Sign In With Google")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                    
                    // Sign Up Link
                    HStack {
                        Text("Don’t Have An Account?")
                            .foregroundColor(.gray)
                        Button(action: {
                            // Action for sign up
                        }) {
                            Text("Sign Up For Free")
                                .foregroundColor(.blue)
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
            .navigationBarHidden(true)
        }
    }
}

// Custom Toggle Style for Checkbox
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .blue : .gray)
                configuration.label
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
