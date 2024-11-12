import SwiftUI

struct MyOrdersView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab = "Delivered"
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
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
                .overlay(
                    Text("My Orders")
                        .font(.headline)
                        .fontWeight(.bold)
                )
                .padding()            // Custom Segmented Control
                HStack {
                    ForEach(["Delivered", "Processing", "Cancelled"], id: \.self) { status in
                        Button(action: {
                            selectedTab = status
                        }) {
                            Text(status)
                                .padding()
                                .background(selectedTab == status ? Color.blue : Color.clear)
                                .foregroundColor(selectedTab == status ? .white : .gray)
                                .cornerRadius(20)
                        }
                    }
                }
                .padding()
                
                // Orders List
                ScrollView {
                    
                    ForEach(0..<3) { _ in
                        VStack(spacing: 8) {
                            // Order Number and Date Row
                            HStack {
                                Text("Order NO: 1947034")
                                    .font(.headline)
                                
                                Spacer()
                                
                                Text("05-12-2019")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            // Tracking Number, Quantity, and Total Amount Row
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Tracking number: IW3475453455")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    HStack {
                                        Text("Quantity:")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        
                                        Text("3")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                        
                                        Spacer()
                                        
                                        Text("Total Amount:")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        
                                        Text("112$")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                    }
                                }
                            }
                            
                            // Details Button and Status Row
                            HStack {
                                // Navigate to MyOrderDetailView when Details is clicked
                                NavigationLink(destination: OrderDetailsView()) {
                                    Text("Details")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 8)
                                        .background(Color.blue)
                                        .cornerRadius(8)
                                }
                                
                                Spacer()
                                
                                Text("Delivered")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                            
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
                        .padding(.horizontal)
                    }
                }
                Spacer()
                VStack(spacing: 0) {
                    Divider() // Separator line for the tab bar
                    
                    HStack(spacing: 0) {
                        Spacer()
                        
                        VStack {
                            Image(systemName: "heart")
                                .font(.title2)
                                .foregroundColor(.gray)
                            Text("Favourite")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack {
                            Image(systemName: "cart")
                                .font(.title2)
                                .foregroundColor(.gray)
                            Text("Cart")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack {
                            Image(systemName: "house.fill")
                                .font(.title2)
                                .foregroundColor(.gray)
                            Text("Home")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack {
                            Image(systemName: "bag")
                                .font(.title2)
                                .foregroundColor(.gray)
                            Text("Shopping")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        VStack {
                            Image(systemName: "person")
                                .font(.title2)
                                .foregroundColor(.blue)
                            Text("Profile")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    
                    // Home Indicator
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.black)
                        .frame(width: 120, height: 5)
                        .padding(.bottom, 2)
                }
                .background(Color.white)
            }
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
        }
    }
}
struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView()
    }
}
