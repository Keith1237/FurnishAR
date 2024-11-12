import SwiftUI

struct ReviewsView: View {
    @State private var newReviewText: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Dismisses the view to go back
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
                    
                    // Centered Profile Title
                    Text("Review")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer() // Keeps title centered with back button
                    
                    // Invisible button to balance the layout
                    Button(action: {}) {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 45, height: 45)
                    }
                }
                .padding([.leading, .trailing, .top], 10)
                .padding(.top, 10)
                HStack(alignment: .top, spacing: 16) {
                    // Left side: Rating score, stars, and review count
                    VStack(alignment: .leading) {
                        Text("4.6")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 4) {
                            ForEach(0..<4, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            Image(systemName: "star.leadinghalf.filled")
                                .foregroundColor(.yellow)
                        }
                        
                        Text("367 Reviews")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    // Right side: Stars breakdown
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach((1...5).reversed(), id: \.self) { star in
                            HStack {
                                Text("\(star) Stars")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                ProgressView(value: max(0.0, min(1.0, self.getStarPercentage(star: star))))
                                    .accentColor(.blue)
                                    .frame(width: 100)
                                Text("\(Int(getStarPercentage(star: star) * 100))%")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding()
                Divider()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Updated ReviewRow with profile images
                        ReviewRow(userName: "Angelina Anderson", timeAgo: "16 Minute Ago", reviewText: "Nice Studio, The App Where You Can Buy Your Furniture With Just A Top Without Any Hassle. Products Are Really Awesome...", profileImage: "profile_icon")
                        ReviewRow(userName: "Anila Erin Maha", timeAgo: "16 Minute Ago", reviewText: "Excellent Place To Discuss Your Furniture Ideas And Get Good Suggestions And Details.", profileImage: "profile_icon")
                        ReviewRow(userName: "Keith Praveen", timeAgo: "16 Minute Ago", reviewText: "Excellent Place To Discuss Your Furniture Ideas And Get Good Suggestions And Details.", profileImage: "keith")
                    }
                    .padding()                }
                HStack {
                    TextField("Add a Review", text: $newReviewText)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(20)
                    
                    Button(action: {
                        // Send review action
                    }) {
                        Image(systemName: "paperplane.fill")
                            .font(.title3)
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func getStarPercentage(star: Int) -> Double {
        switch star {
        case 5: return 0.86
        case 4: return 0.16
        case 3: return 0.12
        case 2: return 0.08
        case 1: return 0.04
        default: return 0.0
        }
    }
}

struct ReviewRow: View {
    var userName: String
    var timeAgo: String
    var reviewText: String
    var profileImage: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(profileImage) // Use the profile image from assets
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 1) // Optional border
                )
            
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(userName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(timeAgo)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 4) {
                    ForEach(0..<4) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                }
                
                Text(reviewText)
                    .font(.body)
                    .foregroundColor(.gray)
                
                Button(action: {
                    // Read more action
                }) {
                    Text("Read More")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
