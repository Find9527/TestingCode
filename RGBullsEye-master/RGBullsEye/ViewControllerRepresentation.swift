
import SwiftUI

struct ViewControllerRepresentation: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerRepresentation>) -> ViewControllerRepresentation.UIViewControllerType {
        return UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
    }
    
    func updateUIViewController(_ uiViewController: ViewControllerRepresentation.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerRepresentation>) {
    }
}
