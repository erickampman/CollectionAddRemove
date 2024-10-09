//
//  AddItemView.swift
//  CollectionAddRemove
//
//  Created by Eric Kampman on 10/9/24.
//

import SwiftUI

struct AddItemView: View {
	@Binding var collectionManager: CollectionManager
	@State var title: String = ""
	@State var instance: Int64 = 0
	@Environment(\.dismiss) private var dismiss
	
    var body: some View {
		Form {
			Section("Add Item") {
				TextField("Item Title", text: $title)
				TextField("Item Instance", value: $instance, format: .number)
			}
		}
		.padding()
		
		HStack {
			Button("Add") {
				collectionManager.append(Item(title: title, instance: instance))
				dismiss()
			}
			.buttonStyle(BorderedButtonStyle())
			.disabled(title.isEmpty ||
					  collectionManager.isDuplicate(title: title, instance: instance))
			Button("Cancel") {
				dismiss()
			}
			.buttonStyle(BorderedButtonStyle())
		}
		.padding()
    }
}

#Preview {
	@Previewable @State var collectionManager: CollectionManager = .init()
	AddItemView(collectionManager: $collectionManager)
}
