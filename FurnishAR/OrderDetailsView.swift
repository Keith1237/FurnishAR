import SwiftUI

struct OrderDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .leading) {
            // Header with back button
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
                Text("Order Details")
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                // Placeholder for balancing
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.clear)
                }
            }
            .padding()
            Text("Order Informations")
                .font(.headline)
                .padding(.bottom, 5)
                .padding(.leading)
            ScrollView {
                // Order Information Section
                VStack(alignment: .leading, spacing: 10) {
                    
                    
                    ForEach(0..<3) { _ in
                        HStack {
                            Image("chair")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Hallingdal Chair")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("Haitt-Loren")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                Text("Units: 1")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("$258.91")
                                .font(.headline)
                                .fontWeight(.light)
                                .foregroundColor(Color(hex: "#FF8A65"))
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // Additional Order Details
                    Group {
                        DetailRow(label: "Order Date", value: "05-12-2019")
                        DetailRow(label: "Tracking Number", value: "IW3475453455")
                        DetailRow(label: "Order No", value: "IW3475453455")
                        DetailRow(label: "Shipping Address", value: "3 Newbridge Court, Chino Hills, CA 91709, United States")
                        DetailRow(label: "Payment Method", value: "**** **** **** 3947", image: Image("mastercard")
                            )
                        DetailRow(label: "Delivery Method", value: "FedEx, 3 days, 15$")
                        DetailRow(label: "Discount", value: "10% , Personal Promo Code")
                        DetailRow(label: "Total Amount", value: "$517.82")
                        DetailRow(label: "Order Status", value: "Delivered")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.horizontal)
                
                Spacer()
            }
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

struct DetailRow: View {
    let label: String
    let value: String
    var image: Image? = nil // Optional image parameter

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            
            if let image = image {
                image
                    .resizable() // Make the image resizable
                    .frame(width: 36, height: 28) // Set custom size
                    .padding(.trailing, 4)
                
                    
            }
            
            Text(value)
                .fontWeight(.semibold)
        }
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView()
    }
}
