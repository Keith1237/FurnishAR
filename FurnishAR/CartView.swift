import SwiftUI

struct CartView: View {
    @State private var promoCode: String = ""
    @State private var showPromoPopup = false
    @State private var discountPercentage: Double = 0.0 // New state for discount percentage
    @State private var cartItems = [
        CartItem(name: "Minimalist Chair", brand: "Regal Do Lobo", unitPrice: 100.0, quantity: 4, itemImage: "chair2"),
        CartItem(name: "Hallingdal Chair", brand: "Hatil-Loren", unitPrice: 100.0, quantity: 1, itemImage: "chair1"),
        CartItem(name: "Hiro Armchair", brand: "Hatil-Loren", unitPrice: 100.0, quantity: 3, itemImage: "chair")
    ]
    
    // Computed property to calculate subtotal
    private var subtotal: Double {
        cartItems.reduce(0) { $0 + ($1.unitPrice * Double($1.quantity)) }
    }
    
    // Computed property to calculate discount based on promo code
    private var promoDiscount: Double {
        subtotal * (discountPercentage / 100)
    }
    
    // Computed property to calculate total amount after discount
    private var totalAmount: Double {
        subtotal - promoDiscount
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // Custom Header
                    HStack {
                        Button(action: {
                            // Action to go back
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(.black)
                                .padding()
                                .background(Circle().fill(Color.white))
                        }
                        
                        Spacer()
                        
                        Text("Cart")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            // Action to clear cart
                        }) {
                            Image(systemName: "trash")
                                .font(.title2)
                                .foregroundColor(.black)
                                .padding()
                                .background(Circle().fill(Color.white))
                        }
                    }
                    .padding(.top, 10)
                    .padding(.horizontal)
                    
                    // Cart Items List
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach($cartItems) { $item in
                                CartItemView(cartItem: $item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Promo Code Section with Arrow Button
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Promo Code")
                            .font(.headline)
                        
                        HStack {
                            TextField("Enter your promo code", text: $promoCode)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                            
                            Button(action: {
                                withAnimation {
                                    showPromoPopup = true
                                }
                            }) {
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.bottom, 10)
                    }
                    .padding(.horizontal)
                    
                    // Order Summary
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Order Summary")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack {
                            Text("Subtotal")
                            Spacer()
                            Text("$\(subtotal, specifier: "%.2f")")
                                .foregroundColor(.orange)
                        }
                        
                        HStack {
                            Text("Promo Code Discount")
                            Spacer()
                            Text("-$\(promoDiscount, specifier: "%.2f")")
                                .foregroundColor(.orange)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Total Amount")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            Text("$\(totalAmount, specifier: "%.2f")")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                        
                        // Checkout Button
                        Button(action: {
                            // Action to proceed to checkout
                        }) {
                            Text("Check Out")
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .padding(.top, 20)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .background(Color(.systemGray6).ignoresSafeArea())
                .navigationBarHidden(true) // Hide navigation bar
                .navigationBarBackButtonHidden(true) // Hide default back button
                
                // Promo Code Popup Overlay
                if showPromoPopup {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                showPromoPopup = false
                            }
                        }
                    
                    PromoCodePopupView(showPromoPopup: $showPromoPopup, promoCode: $promoCode, discountPercentage: $discountPercentage)
                        .transition(.move(edge: .bottom))
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// Remaining views and preview struct remain the same


struct PromoCodePopupView: View {
    @Binding var showPromoPopup: Bool
    @Binding var promoCode: String
    @Binding var discountPercentage: Double // Bind discount percentage to update CartView
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 5)
                .padding(.top, 8)
            
            Text("Your Promo Codes")
                .font(.headline)
                .padding(.top)
            
            // Promo Code List
            VStack(spacing: 16) {
                PromoCodeItemView(percentage: 10, title: "Personal offer", code: "mypromocode2020", daysRemaining: "6 days remaining", promoCode: $promoCode, discountPercentage: $discountPercentage, showPopup: $showPromoPopup)
                PromoCodeItemView(percentage: 15, title: "Summer Sale", code: "summer2020", daysRemaining: "23 days remaining", promoCode: $promoCode, discountPercentage: $discountPercentage, showPopup: $showPromoPopup)
                PromoCodeItemView(percentage: 22, title: "Personal offer", code: "mypromocode2020", daysRemaining: "6 days remaining", promoCode: $promoCode, discountPercentage: $discountPercentage, showPopup: $showPromoPopup)
            }
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .padding(.top, 100)
    }
}

struct PromoCodeItemView: View {
    var percentage: Double
    var title: String
    var code: String
    var daysRemaining: String
    @Binding var promoCode: String
    @Binding var discountPercentage: Double // Bind discount percentage to update CartView
    @Binding var showPopup: Bool
    
    var body: some View {
        HStack {
            VStack {
                Text("\(Int(percentage))%")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(code)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(daysRemaining)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {
                promoCode = code
                discountPercentage = percentage // Set selected discount percentage
                withAnimation {
                    showPopup = false
                }
            }) {
                Text("Apply")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color(.systemGray6).ignoresSafeArea())
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

// MARK: - CartItem and CartItemView remain the same

struct CartItem: Identifiable {
    let id = UUID()
    var name: String
    var brand: String
    var unitPrice: Double
    var quantity: Int
    var itemImage: String
}

struct CartItemView: View {
    @Binding var cartItem: CartItem
    
    var body: some View {
        HStack {
            Image(cartItem.itemImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(8)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(cartItem.name)
                    .font(.headline)
                Text(cartItem.brand)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("$\(cartItem.unitPrice * Double(cartItem.quantity), specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            Spacer()
            
            HStack {
                Button(action: {
                    if cartItem.quantity > 1 {
                        cartItem.quantity -= 1
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.blue)
                }
                Text("\(cartItem.quantity)")
                    .font(.headline)
                Button(action: {
                    cartItem.quantity += 1
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

// MARK: - Preview
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
