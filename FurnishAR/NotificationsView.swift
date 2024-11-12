import SwiftUI

struct Notification: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let timeAgo: String
}

// Profile view to navigate to
struct UserProfileView: View {
    var body: some View {
        Text("Profile View")
            .font(.largeTitle)
            .padding()
    }
}

struct NotificationsView: View {
    @State private var notifications = [
        Notification(image: "chair", title: "Your Order Will Be Shipped. Once We Get Confirm Address", timeAgo: "16 minutes ago"),
        Notification(image: "chair2", title: "Special Offer On Bean Upto 46% Off All The Products", timeAgo: "26 minutes ago"),
        Notification(image: "chair", title: "New Products You May Like Are Available Go And Show Now.", timeAgo: "49 minutes ago"),
        Notification(image: "chair1", title: "Your Order 3 Summery Green Chair Has Been Shipped!", timeAgo: "16 days ago")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Title and Clear All Button
                HStack {
                    NavigationLink(destination: ProfileView()) {
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
                    
                    Text("Notifications")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    // Clear All button
                    Button(action: {
                        notifications.removeAll()
                    }) {
                        Text("Clear All")
                            .foregroundColor(.blue)
                    }
                    .disabled(notifications.isEmpty) // Disable when there are no notifications
                }
                .padding()
                
                if notifications.isEmpty {
                    // Empty State
                    Spacer()
                    Text("Empty Here")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    // Notifications List
                    List {
                        ForEach(notifications) { notification in
                            NotificationRow(notification: notification)
                                .swipeActions(edge: .trailing) {
                                    Button {
                                        if let index = notifications.firstIndex(where: { $0.id == notification.id }) {
                                            notifications.remove(at: index)
                                        }
                                    } label: {
                                        ZStack {
                                            Circle()
                                                .fill(Color.red)
                                                .frame(width: 40, height: 40) // Circle size
                                            Image(systemName: "trash")
                                                .foregroundColor(.white) // White trash icon
                                                .font(.system(size: 20)) // Adjust icon size
                                        }
                                    }
                                    .tint(.red) // Change button tint to red
                                }
                        }
                    }
                    .listStyle(PlainListStyle()) // Optional: Plain style for cleaner look
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
                        .padding(.bottom)
                }
                .background(Color.white)
            }
            .background(Color(.systemGray6).ignoresSafeArea())
        }
    }
}

// Notification row for displaying individual notifications
struct NotificationRow: View {
    var notification: Notification
    
    var body: some View {
        HStack {
            Image(notification.image) // Loads image from assets
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.trailing, 10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.title)
                    .font(.body)
                    .fontWeight(.medium)
                
                Text(notification.timeAgo)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// Preview for NotificationsView
struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
