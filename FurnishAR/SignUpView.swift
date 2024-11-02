import SwiftUI



struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    

    var body: some View {
     
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Back Button
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
                                    //.foregroundColor(.black) // Color of the arrow
                            }
                            .padding(.leading, 0)
                        }
                        Spacer()
                    }
                    
                    // Welcome Text
                    Text("Create Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text("Let’s create account toghter")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    //Name Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Full Name")
                            .font(.headline)
                            .foregroundColor(.black)
                        TextField("Enter Your Name", text: $email)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    // Email Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.headline)
                            .foregroundColor(.black)
                        TextField("Enter Your Email", text: $email)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    
                    // Password Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(.headline)
                            .foregroundColor(.black)
                        SecureField("Enter Your Password", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    
                    // Remember Me & Forgot Password
                  
                    
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
                                .frame(width: 20, height: 20)
                            Text("Sign up with google")
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
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        Button(action: {
                            // Action for sign up
                        }) {
                            Text("Sign in")
                                .foregroundColor(.blue)
                                .fontWeight(.bold)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 10)
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
            .background(Color(hex: "#F9F9F9"))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
