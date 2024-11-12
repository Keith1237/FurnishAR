import SwiftUI

struct CheckoutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text("Checkout")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
            
            // Shipping To Section
            VStack(alignment: .leading) {
                Text("Shipping To")
                    .font(.headline)
                    .padding(.bottom, 5)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Home Address")
                            .font(.subheadline)
                            .bold()
                        Text("(269) 444-6853")
                            .font(.caption)
                        Text("Road Number 5649 Akali")
                            .font(.caption)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            }
            
            // Payment Method Section
            VStack(alignment: .leading) {
                Text("Payment Method")
                    .font(.headline)
                    .padding(.bottom, 5)
                HStack {
                    Image(systemName: "creditcard.fill")
                        .foregroundColor(.orange)
                    Text("Credit Card")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            }
            
            // Delivery Method Section
            VStack(alignment: .leading) {
                Text("Delivery Method")
                    .font(.headline)
                    .padding(.bottom, 5)
                HStack(spacing: 15) {
                    Image("FedExLogo") // Use appropriate asset names for logos
                        .resizable()
                        .frame(width: 50, height: 50)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                    Image("USPSLogo")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                    Image("DHLLogo")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
            }
            
            // Amount Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Amount")
                    .font(.headline)
                HStack {
                    Text("Order Total")
                    Spacer()
                    Text("$367.65")
                        .foregroundColor(.orange)
                }
                HStack {
                    Text("Delivery Fee")
                    Spacer()
                    Text("$80.00")
                        .foregroundColor(.orange)
                }
                Divider()
                HStack {
                    Text("Total")
                        .bold()
                    Spacer()
                    Text("$447.99")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.orange)
                }
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
            
            // Payment Button
            Button(action: {
                // Payment action here
            }) {
                Text("Payment")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding(.top)
        .background(Color(UIColor.systemBackground))
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
