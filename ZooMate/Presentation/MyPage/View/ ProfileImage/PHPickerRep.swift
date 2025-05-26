//
//  PHPickerRep.swift
//  ZooMate
//
//  Created by 최준영 on 5/24/25.
//

import SwiftUI
import PhotosUI

class PHCoordinator: NSObject, PHPickerViewControllerDelegate {
    
    var parent: PHPickerRep
    init(parent: PHPickerRep) {
        self.parent = parent
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let provider = results.first?.itemProvider,
              provider.canLoadObject(ofClass: UIImage.self)
        else { return }
        provider.loadObject(ofClass: UIImage.self) { image, _ in
            DispatchQueue.main.async {
                self.parent.image = image as? UIImage
            }
        }
    }
}

struct PHPickerRep: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> PHCoordinator {
        PHCoordinator(parent: self)
    }
}
