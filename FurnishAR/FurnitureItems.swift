import Foundation
import FirebaseFirestore
import SwiftUI

// Model for Furniture Item
struct FurnitureItem: Identifiable {
    var id: String
    var name: String
    var price: Double
    var imageUrl: String
}

// ViewModel for managing and fetching Furniture Items
class FurnitureViewModel: ObservableObject {
    @Published var items: [FurnitureItem] = []

    private var db = Firestore.firestore()
    
    func fetchItems() {
        db.collection("FurnitureItems").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            
            self.items = snapshot?.documents.compactMap { document -> FurnitureItem? in
                let data = document.data()
                let id = document.documentID
                let name = data["name"] as? String ?? ""
                let price = data["price"] as? Double ?? 0.0
                let imageUrl = data["imageUrl"] as? String ?? ""
                
                return FurnitureItem(id: id, name: name, price: price, imageUrl: imageUrl)
            } ?? []
        }
    }
}
