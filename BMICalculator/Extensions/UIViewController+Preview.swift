//
//  UIViewController+Preview.swift
//  BMICalculator
//
//  Created by Дмитрий Лубов on 07.06.2024.
//

#if DEBUG
import SwiftUI

extension UIViewController {
	struct Preview: UIViewControllerRepresentable {
		let viewController: UIViewController
		
		func makeUIViewController(context: Context) -> some UIViewController {
			viewController
		}
		
		func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
	}
	
	func previw() -> some View {
		Preview(viewController: self).edgesIgnoringSafeArea(.all)
	}
}
#endif
