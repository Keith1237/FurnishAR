import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let productCount: Int
}

struct CategoriesView: View {
    let categories = [
        Category(imageName: "chair2", title: "Living Room", productCount: 126),
        Category(imageName: "chair1", title: "Bedroom", productCount: 236),
        Category(imageName: "chair", title: "Dining Room", productCount: 375),
        Category(imageName: "chair", title: "Office", productCount: 296),
        Category(imageName: "chair2", title: "Outdoor", productCount: 946)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Custom Navigation Header
                HStack {
                    Button(action: {
                        // Action for back button
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .padding()
                            .background(Circle().fill(Color.white))
                    }
                    
                    Spacer()
                    
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Spacer() // Placeholder for symmetry
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Categories List
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(categories) { category in
                            HStack {
                                Image(category.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading) {
                                    Text(category.title)
                                        .font(.headline)
                                    
                                    Text("\(category.productCount) products")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                // Tab Bar
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
                                .foregroundColor(.blue)
                            Text("Shopping")
                                .font(.caption)
                                .foregroundColor(.blue)
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
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}

struct TabBarButton: View {
    let imageName: String
    let title: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 22))
                .foregroundColor(isSelected ? .blue : .gray)
            
            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
