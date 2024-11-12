import SwiftUI
import SceneKit

struct DetailView: View {
    var body: some View {
        NavigationView {
            Home()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct Home: View {
    @Environment(\.presentationMode) var presentationMode
    @State var models: [Model] = [
        Model(id: 0, name: "Ox Mathis Furniture Modern Style", modelName: "Earth", price: 90.99, details: "The Swedish Designer Monica Forstar’s Style is characterized by her eternal love for new materials and beautiful pure shapes. This style emphasizes simplicity, functionality, and organic shapes, making it a popular choice in modern furniture design.")
    ]
    
    @State var index = 0
    @State var quantity = 1
    @State var isFavorited = false
    @State var likesCount = 294
    
    var body: some View {
        VStack(spacing: 20) {
            // Top Bar with Back and Favorite buttons
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
                
                Button(action: {
                    isFavorited.toggle()
                    if isFavorited {
                        likesCount += 1
                    } else {
                        likesCount -= 1
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                        Image(systemName: isFavorited ? "heart.fill" : "heart")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(isFavorited ? .red : .black)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            // SceneKit view to display 3D model
            ZStack {
                // SceneKit view to display 3D model
                SceneView(
                    scene: SCNScene(named: models[index].modelName + ".usdz"),
                    options: [.autoenablesDefaultLighting, .allowsCameraControl]
                )
                .frame(height: 300) // Set your desired height

                // AR Button (circular) inside the same frame as SceneView
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: ARViewPage(model: models[index])) {
                            Image(systemName: "arkit")
                                .font(.title)
                                .padding(10)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                }
            }
            .frame(height: 300) // Set frame height for SceneView only

            
            
            
            
            
            
            
            
            
            
            
            // Title, Price, and Ratings
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    Text(models[index].name)
                        .font(.title)
                        .fontWeight(.regular)
                        .fixedSize(horizontal: false, vertical: true) // Ensure full name is displayed without truncation
                    
                    Spacer()
                    VStack{
                        Text("$\(models[index].price, specifier: "%.2f")")
                            .font(.title2)
                            .foregroundColor(.orange)
                        
                        Button(action: {
                            // Action for adding a review
                        }) {
                            HStack {
                                
                                Text("Add Review")
                                    .font(.footnote)
                            }
                            .padding(8)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        }
                        .padding(.horizontal, 10)
                    }
                }
                
                HStack {
                    HStack(spacing: 4) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        Image(systemName: "star.leadinghalf.filled")
                            .foregroundColor(.yellow)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        HStack {
                            Image(systemName: "eye")
                            Text("341 Seen")
                        }
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("\(likesCount) Liked")
                        }
                    }
                    .font(.footnote)
                    .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            // Scrollable Description
            Text("Description")
                .font(.headline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(models[index].details)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: 150) // Adjust max height as needed for scrolling
            
            // Add Review Button
            
            // Quantity Selector with Minus and Plus Buttons
            HStack {
                Button(action: {
                    if quantity > 1 {
                        quantity -= 1
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.blue)
                        .font(.title2)
                }
                
                Text("\(quantity)")
                    .font(.headline)
                
                Button(action: {
                    quantity += 1
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                        .font(.title2)
                }
                
                Spacer()
                
                Text("Total: $\(models[index].price * Double(quantity), specifier: "%.2f")")
                    .font(.headline)
            }
            .padding(.horizontal)
            
            Button(action: {
                // Add to cart action
            }) {
                Text("Add To Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
           

        }
        .navigationBarHidden(true)
        .background(Color(.systemGray6).ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}
struct Model: Identifiable {
    var id: Int
    var name: String
    var modelName: String
    var price: Double
    var details: String
}
