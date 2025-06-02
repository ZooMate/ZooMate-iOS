//
//  PHPickerMultiImage.swift
//  ZooMate
//
//  Created by 최준영 on 5/31/25.
//

import SwiftUI
import PhotosUI

struct PHPickerMultiImage: UIViewControllerRepresentable {
    @Binding var selectedItems: [(id: String, image: UIImage)]

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.selectionLimit = 10
        config.filter = .images

        // 미리 선택된 항목 유지
        config.preselectedAssetIdentifiers = selectedItems.map { $0.id }

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PHPickerMultiImage

        init(_ parent: PHPickerMultiImage) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            var newItems: [(id: String, image: UIImage)] = []

            for result in results {
                guard let assetId = result.assetIdentifier else { continue }

                if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    result.itemProvider.loadObject(ofClass: UIImage.self) { object, _ in
                        if let image = object as? UIImage {
                            DispatchQueue.main.async {
                                // 중복 방지
                                if !newItems.contains(where: { $0.id == assetId }) {
                                    newItems.append((id: assetId, image: image))
                                }

                                // 마지막 이미지까지 로딩 후 교체
                                if newItems.count == results.count {
                                    self.parent.selectedItems = newItems
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
