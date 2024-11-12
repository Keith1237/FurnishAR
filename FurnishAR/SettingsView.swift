import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Navigation Bar
                HStack {
                    Button(action: {
                        // Dismiss the view
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
                    
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 45, height: 45)
                }
                .padding([.leading, .trailing, .top], 20)
                
                // Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Personal Information Section
                        Text("Personal Information")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        TextBoxView(title: "Name", text: "Keith Praveen", isEditable: false)
                        TextBoxView(title: "Birth", text: "2001/01/23", isEditable: false)
                        
                        // Password Section
                        Text("Password")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        TextBoxView(title: "Password", text: "**************", isEditable: true, action: {
                            // Action to edit password
                        })
                        
                        // Email Section
                        Text("Email")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        TextBoxView(title: "Email", text: "Keithpraveen23@Gmail.Com", isEditable: true, action: {
                            // Action to edit email
                        })
                    }
                    .padding(.horizontal, 16)
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
            .background(Color(.systemGray6))
        }
    }
}

// Custom TextBoxView Component for the input fields with inline Edit button
struct TextBoxView: View {
    var title: String
    var text: String
    var isEditable: Bool = false
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                TextField("", text: .constant(text))
                    .disabled(!isEditable)
                    .foregroundColor(.black)
                    .padding()
                   
                
                if isEditable {
                    Button(action: {
                        action?()
                    }) {
                        Text("Edit")
                            .foregroundColor(.blue)
                            .font(.headline)
                            .padding(.trailing, 8) // Align button to the right inside the box
                    }
                }
            }
            .background(Color.white) // Set background color to white
            .cornerRadius(20)
        }
        .padding(.horizontal)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
