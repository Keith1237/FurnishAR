import SwiftUI
import ARKit
import RealityKit

struct ARViewPage: View {
    var model: Model
    
    var body: some View {
        VStack {
            Text("Place the \(model.name) in AR")
                .font(.title)
                .padding()
            
            ARViewContainer(model: model)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ARViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ARViewPage(model: Model(id: 0, name: "Ox Mathis Furniture Modern Style", modelName: "Earth", price: 90.99, details: "Description here"))
    }
}
