//
//  SceneDelegate.swift
//  BMICalculator
//
//  Created by Дмитрий Лубов on 07.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = CalculateViewController(calculatorManager: CalculatorManager())
		window.makeKeyAndVisible()

		self.window = window
	}
}

