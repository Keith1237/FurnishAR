import SwiftUI

struct FavouritesView: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @Environment(\.presentationMode) var presentationMode

    let items = [
        FavouritesItem(name: "Georg Jensen Milimal Chair", price: 424.00, image: "chair"),
        FavouritesItem(name: "Pearly Beading Fox Chair", price: 561.00, image: "chair"),
        FavouritesItem(name: "Florence Arcadia Chair", price: 645.21, image: "chair1"),
        FavouritesItem(name: "Atelier Ottoman Takumi Chair", price: 929.68, image: "chair2"),
        FavouritesItem(name: "Florence Chair", price: 645.21, image: "chair1"),
        FavouritesItem(name: "Atelier Takumi Chair", price: 929.68, image: "chair2")
    ]
    
    var filteredItems: [FavouritesItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Navigation Bar
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Back action
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .foregroundColor(.black)
                            
                    }

                    Spacer()

                    Text("Favourites")
                        .font(.title)
                        .fontWeight(.bold)

                    Spacer()

                    Button(action: {}) {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 45, height: 45) // Invisible button for layout balance
                    }
                }
                .padding([.leading, .trailing, .top])

                
                
                // Grid of Items
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(filteredItems) { item in
                            VStack(alignment: .leading) {
                                ZStack(alignment: .topTrailing) {
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(10)

                                    Button(action: {
                                        // Favorite action
                                    }) {
                                        Image(systemName: "heart")
                                            .padding(8)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .foregroundColor(.gray)
                                    }
                                    .padding([.top, .trailing], 8)
                                }

                                Text(item.name)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .lineLimit(2)

                                Text(String(format: "$%.2f", item.price))
                                    .font(.subheadline)
                                    .foregroundColor(.orange)
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer() // Pushes the content upwards, allowing the bottom bar to stay at the bottom.

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
                                .foregroundColor(.blue)
                            Text("Home")
                                .font(.caption)
                                .foregroundColor(.blue)
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
                                .foregroundColor(.gray)
                            Text("Profile")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    
                    // Home Indicator at the very bottom
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

// Model for Furniture Item
struct FavouritesItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var image: String
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
