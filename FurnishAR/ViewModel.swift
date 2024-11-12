import SwiftUI
import FirebaseFirestore

struct Item: Identifiable {
    var id: String
    var itemName: String
    var brandName: String
    var price: Double
    var imageUrl: String
}


class PopularItemsViewModel: ObservableObject {
    @Published var items = [Item]()

    private var db = Firestore.firestore()

    func fetchPopularItems() {
        db.collection("popularItems").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }

            self.items = documents.compactMap { doc -> Item? in
                let data = doc.data()
                guard let itemName = data["ItemName"] as? String,
                      let brandName = data["BrandName"] as? String,
                      let price = data["Price"] as? Double,
                      let imageUrl = data["ImageUrl"] as? String else {
                    return nil
                }
                return Item(id: doc.documentID, itemName: itemName, brandName: brandName, price: price, imageUrl: imageUrl)
            }
        }
    }
}
