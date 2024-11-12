import SwiftUI


struct HomeView: View {
    @State private var selectedCategory = "Armchair"
    @StateObject private var popularItemsViewModel = PopularItemsViewModel()
       

    
    var body: some View {
        VStack(spacing: 0) {
            // Custom Navigation Bar
            HStack {
                Image("profile_icon") // Profile Image
                    .resizable()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text("Welcome,")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text("Keith Praveen")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                ZStack{
                    Circle()
                        .fill(Color.white)
                        .frame(width: 45, height: 45)
                        .padding(.trailing)
                    Image(systemName: "bell") // Notification Icon
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.trailing)
                }
                
            }
            .padding(.vertical)
            .background(Color(.systemGray6))
            
            Spacer()
            
            HStack {
                Image(systemName: "magnifyingglass") // Search Icon
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.leading)
                TextField("Search Furniture", text: .constant(""))
                    .padding(.leading, 5)
                Spacer()
                Image("Image")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.trailing)
            }
            .frame(height: 50)
            .background(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Spacer()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
            
                    
                    // Special Offers Section
                    VStack(alignment: .leading) {
                        Text("Special Offers")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<3) { _ in
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.blue.opacity(0.3))
                                        .frame(width: 300, height: 150)
                                        .overlay(
                                            VStack(alignment: .leading) {
                                                Text("25% Discount")
                                                    .font(.title)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                Text("For a cozy yellow set!")
                                                    .foregroundColor(.white)
                                                Button(action: {}) {
                                                    Text("Learn More")
                                                        .font(.subheadline)
                                                        .padding(10)
                                                        .background(Color.blue)
                                                        .foregroundColor(.white)
                                                        .cornerRadius(8)
                                                }
                                                .padding(.top, 10)
                                            }
                                            .padding()
                                        )
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    // Category Selection Buttons
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            CategoryButton(icon: "sofa.fill", label: "Armchair", selected: $selectedCategory)
                            CategoryButton(icon: "bed.double.fill", label: "Sofa", selected: $selectedCategory)
                            CategoryButton(icon: "bed.double.fill", label: "Bed", selected: $selectedCategory)
                            CategoryButton(icon: "lightbulb.fill", label: "Light", selected: $selectedCategory)
                            CategoryButton(icon: "table.fill", label: "Table", selected: $selectedCategory)
                        }
                        .padding(.horizontal)
                    }
                    
                    // Most Interested Section
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Most Interested")
                                .font(.headline)
                            Spacer()
                            Button(action: {}) {
                                Text("View All")
                                    .foregroundColor(Color(hex: "#FF8A65"))
                            }
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<3) { _ in
                                    VStack(alignment: .leading, spacing: 8) {
                                        Image(systemName: "chair.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 150, height: 150)
                                            .background(Color.yellow)
                                            .cornerRadius(10)
                                        Text("Ox Mathis Chair")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                        Text("Hans j. wegner")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Text("$9.99")
                                            .foregroundColor(Color(hex: "#FF8A65"))
                                    }
                                    .frame(width: 150)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Popular Section
                    VStack(alignment: .leading) {
                                            HStack {
                                                Text("Popular")
                                                    .font(.headline)
                                                Spacer()
                                                Button(action: {}) {
                                                    Text("View All")
                                                        .foregroundColor(.orange)
                                                }
                                            }
                                            .padding(.horizontal)
                                            
                                            ScrollView(.horizontal, showsIndicators: false) {
                                                HStack(spacing: 20) {
                                                    ForEach(popularItemsViewModel.items) { item in
                                                        VStack(alignment: .leading, spacing: 8) {
                                                            AsyncImage(url: URL(string: item.imageUrl)) { image in
                                                                image
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .frame(width: 120, height: 120)
                                                                    .background(Color.gray.opacity(0.2))
                                                                    .cornerRadius(10)
                                                            } placeholder: {
                                                                ProgressView()
                                                                    .frame(width: 120, height: 120)
                                                            }

                                                            Text(item.itemName)
                                                                .font(.subheadline)
                                                                .fontWeight(.bold)
                                                            Text(item.brandName)
                                                                .font(.caption)
                                                                .foregroundColor(.gray)
                                                            Text("$\(item.price, specifier: "%.2f")")
                                                                .foregroundColor(Color(hex: "#FF8A65"))
                                                        }
                                                        .frame(width: 120)
                                                    }
                                                }
                                                .padding(.horizontal)
                                            }
                                        }
                    
                    Spacer()
                }
            }
            
            // Bottom Tab Bar with Home Indicator
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
                
                // Home Indicator
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.black)
                    .frame(width: 120, height: 5)
                    .padding(.bottom, 2)
            }
            .background(Color.white)
        }
        .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

// Custom Button View for Categories
struct CategoryButton: View {
    let icon: String
    let label: String
    @Binding var selected: String
    
    var body: some View {
        Button(action: {
            selected = label
        }) {
            HStack {
                Image(systemName: icon)
                Text(label)
                    .fontWeight(selected == label ? .bold : .regular)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(selected == label ? Color.blue : Color(.systemGray5))
            .foregroundColor(selected == label ? .white : .gray)
            .cornerRadius(10)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
