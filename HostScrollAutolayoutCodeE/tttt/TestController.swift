//
//  TestController.swift
//  tttt
//
//  Created by Orange on 2021/6/25.
//

import UIKit
import SwiftUI


class TestController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let hosting = HostingController()
        view.addSubview(hosting.view)
    }
}




struct TestPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let hostController = HostingController()
        return hostController
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    typealias UIViewControllerType = UIViewController
}


struct TestPreview_Previews: PreviewProvider {
    static var previews: some View {
        TestPreview()
    }
}
