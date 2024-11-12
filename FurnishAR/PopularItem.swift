import SwiftUI

struct PopularItem: Identifiable {
    let id = UUID()
    let name: String
    let brand: String
    let price: Double
    let imageName: String
}

struct PopularItemsView: View {
    @Environment(\.presentationMode) var presentationMode
    let items = [
        PopularItem(name: "Levi Armchair", brand: "Cultured White", price: 279.95, imageName: "chair1"),
        PopularItem(name: "Hiro Armchair", brand: "Cultured White", price: 258.91, imageName: "chair2"),
        PopularItem(name: "Slipcove Armchair", brand: "Hatil-Loren", price: 369.86, imageName: "chair"),
        PopularItem(name: "Rose Armchair", brand: "Regal Furniture", price: 258.91, imageName: "onboard1"),
        PopularItem(name: "Besen Egge Chair", brand: "Partex Furniture", price: 369.86, imageName: "chair"),
        PopularItem(name: "Slipcove Armchair", brand: "Hatil-Loren", price: 369.86, imageName: "chair2")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Header with back button and title
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
                    
                    Text("Popular")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 45, height: 45)
                    }
                }
                .padding([.leading, .trailing, .top], 20)
                
                // List of popular items
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(items) { item in
                            PopularItemRow(item: item)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Custom tab bar
                VStack(spacing: 0) {
                    Divider()
                    HStack(spacing: 0) {
                        Spacer()
                        TabBarItem(icon: "heart", label: "Favourite")
                        Spacer()
                        TabBarItem(icon: "cart", label: "Cart")
                        Spacer()
                        TabBarItem(icon: "house.fill", label: "Home", isSelected: true)
                        Spacer()
                        TabBarItem(icon: "bag", label: "Shopping")
                        Spacer()
                        TabBarItem(icon: "person", label: "Profile")
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
            .navigationBarHidden(true)
        }
    }
}

// Popular item row view
struct PopularItemRow: View {
    let item: PopularItem
    
    var body: some View {
        HStack(spacing: 15) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(item.brand)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("$\(item.price, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.orange)
            }
            
            Spacer()
            
            // Cart button with navigation link
            NavigationLink(destination: CartView()) {
                Image(systemName: "cart.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(Color.blue))
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

// Custom tab bar item view
struct TabBarItem: View {
    let icon: String
    let label: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(isSelected ? .blue : .gray)
            Text(label)
                .font(.caption)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}

// Cart view placeholder
struct CartsView: View {
    var body: some View {
        Text("Cart Page")
            .font(.title)
            .navigationTitle("Cart")
    }
}

// Preview
struct PopularItemsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularItemsView()
    }
}
