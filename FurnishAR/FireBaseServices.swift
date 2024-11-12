import Foundation
import FirebaseFirestore
import SwiftUI

struct User: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var surname: String
    var imageUrl: String  // Added property for the image URL
}

class userViewModel: ObservableObject {
    @Published var users = [User]()
     
    private var db = Firestore.firestore()
     
    func fetchData() {
        db.collection("Popular").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
             
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let name = data["BrandName"] as? String ?? ""
                let surname = data["ItemName"] as? String ?? ""
                let imageUrl = data["imageUrl"] as? String ?? ""  // Fetching image URL
                
                return User(name: name, surname: surname, imageUrl: imageUrl)
            }
        }
    }
}
