import SwiftUI

struct FilterView: View {
    @State private var selectedBrand: String = "Damro"
    @State private var selectedColor: String = "Green"
    @State private var priceRange: ClosedRange<Float> = 0...25000
    @State private var selectedRating: Int = 4
    
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
                    
                    Text("Filter")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 45, height: 45)
                    }
                }
                .padding([.leading, .trailing, .top], 20)
                
                // Brand Selection
                HStack {
                    Text("Brand")
                        .font(.headline)
                    
                    Spacer() // This will push "View all" to the far right
                    
                    Button("View all") {
                        // Action to view all brands
                    }
                    .foregroundColor(.orange)
                    .font(.headline)
                }
                .padding([.horizontal, .top])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: { selectedBrand = "Damro" }) {
                            Text("Damro")
                                .padding()
                                .background(selectedBrand == "Damro" ? Color.blue : Color(.systemGray6))
                                .foregroundColor(selectedBrand == "Damro" ? .white : .black)
                                .cornerRadius(20)
                        }
                        Button(action: { selectedBrand = "Regal Furniture" }) {
                            Text("Regal Furniture")
                                .padding()
                                .background(selectedBrand == "Regal Furniture" ? Color.blue : Color(.systemGray6))
                                .foregroundColor(selectedBrand == "Regal Furniture" ? .white : .black)
                                .cornerRadius(20)
                        }
                        Button(action: { selectedBrand = "Hatil" }) {
                            Text("Hatil")
                                .padding()
                                .background(selectedBrand == "Hatil" ? Color.blue : Color(.systemGray6))
                                .foregroundColor(selectedBrand == "Hatil" ? .white : .black)
                                .cornerRadius(20)
                        }
                        Button(action: { selectedBrand = "New" }) {
                            Text("New")
                                .padding()
                                .background(selectedBrand == "New" ? Color.blue : Color(.systemGray6))
                                .foregroundColor(selectedBrand == "New" ? .white : .black)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                }.padding(.trailing)
                
                // Color Selection
                Text("Color")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(["Green", "Yellow", "Black", "Gray"], id: \.self) { color in
                            Button(action: { selectedColor = color }) {
                                HStack {
                                    Circle()
                                        .fill(color == "Green" ? Color.green : color == "Yellow" ? Color.yellow : color == "Black" ? Color.black : Color.gray)
                                        .frame(width: 20, height: 20)
                                        .padding(.leading)
                                    
                                    Text(color)
                                        .padding()
                                        .foregroundColor(selectedColor == color ? .white : .black)
                                    
                                }
                                .background(selectedColor == color ? Color.blue : Color(.systemGray6))
                                .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }.padding(.trailing)
                
                // Price Range Slider
                Text("Price Range")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top)
                
                HStack {
                    Text("$\(Int(priceRange.lowerBound))") // Show lower bound value
                    Spacer()
                    Text("$\(Int(priceRange.upperBound))") // Show upper bound value
                }
                .padding(.horizontal)
                
                RangeSlider(range: $priceRange, minValue: 0, maxValue: 25000)
                    .padding(.horizontal, 16) // Increase padding to move slider left and avoid right edge collision

                // Customer Review
                Text("Customer Review")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top)
                
                HStack {
                    ForEach(1..<6) { rating in
                        Button(action: {
                            selectedRating = rating
                        }) {
                            Text("\(rating) ★")
                                .padding()
                                .background(rating == selectedRating ? Color.blue : Color(.systemGray6))
                                .cornerRadius(5)
                                .foregroundColor(rating == selectedRating ? .white : .black)
                        }
                        Spacer() // Spacer between each button to make them use full width
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    // Apply filter action
                }) {
                    Text("Apply Filter")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
            }
            .navigationBarBackButtonHidden(true)
            .background(Color(.systemGray6))
        }
       
    }
}

// Custom RangeSlider Component
struct RangeSlider: View {
    @Binding var range: ClosedRange<Float>
    let minValue: Float
    let maxValue: Float
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 20 // Reduce width to prevent edge collisions
            let lowerOffset = CGFloat((range.lowerBound - minValue) / (maxValue - minValue)) * width
            let upperOffset = CGFloat((range.upperBound - minValue) / (maxValue - minValue)) * width
            
            ZStack(alignment: .leading) {
                // Track
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 8)
                
                // Range
                Capsule()
                    .fill(Color.blue)
                    .frame(width: upperOffset - lowerOffset, height: 8)
                    .offset(x: lowerOffset)
                
                // Lower Thumb
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                    .offset(x: lowerOffset - 10)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newValue = max(minValue, min(Float(value.location.x / width) * (maxValue - minValue) + minValue, range.upperBound))
                                range = newValue...range.upperBound
                            }
                    )
                
                // Upper Thumb
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                    .offset(x: upperOffset - 10)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newValue = max(range.lowerBound, min(Float(value.location.x / width) * (maxValue - minValue) + minValue, maxValue))
                                range = range.lowerBound...newValue
                            }
                    )
            }
            .padding(.horizontal, 10) // Add padding inside the slider component for better alignment
        }
        .frame(height: 40)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
