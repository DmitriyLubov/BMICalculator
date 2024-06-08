//
//  Sizes.swift
//  BMICalculator
//
//  Created by Дмитрий Лубов on 07.06.2024.
//

import Foundation

/// Список размеров для настройки элементов интерфейса приложения.
enum Sizes {
	
	/// Значение расстояния между элементами интерфейса.
	enum Spacing {

		/// Значение равно 20.
		static let large: CGFloat = 20

		/// Значение равно 10.
		static let medium: CGFloat = 10

		/// Значение равно 5.
		static let small: CGFloat = 5
	}
	
	/// Значение высоты элементов интерфейса.
	enum Height {

		/// Значение равно 100.
		static let large: CGFloat = 100

		/// Значение равно 60.
		static let medium: CGFloat = 60

		/// Значение равно 20.
		static let small: CGFloat = 20
	}
}
