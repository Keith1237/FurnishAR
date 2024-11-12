import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    var model: Model
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Create AR World configuration
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal] // Detect horizontal planes
        arView.session.run(config)
        
        // Load the 3D model
        loadModel(in: arView, modelName: model.modelName)
        
        return arView
    }
    
    func loadModel(in arView: ARView, modelName: String) {
        // Make sure the model exists
        guard let modelEntity = try? Entity.load(named: modelName) else {
            print("Failed to load model: \(modelName)")
            return
        }
        
        // Create an anchor for the model
        let anchorEntity = AnchorEntity(plane: .horizontal)
        anchorEntity.addChild(modelEntity)
        
        // Add the anchor to the scene
        arView.scene.addAnchor(anchorEntity)
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
