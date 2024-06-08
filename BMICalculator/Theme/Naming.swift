//
//  Naming.swift
//  BMICalculator
//
//  Created by Дмитрий Лубов on 07.06.2024.
//

/// Наименования, используемые в приложении.
enum Naming {

	// MARK: - Calculate string

	/// Наименования для экрана расчета BMI.
	enum Calculate {

		/// Заглавие.
		static let title = "CALCULATE YOUR BMI"

		/// Рост.
		static let height = "Height"

		/// Вес.
		static let weight = "Weight"

		/// Метр.
		static let meter = "m"

		/// Килограмм.
		static let kilo = "kg"

		/// Рассчитать.
		static let calculate = "CALCULATE"
	}

	/// Наименования для результирующего экрана.
	enum Result {
		
		/// Заглавие.
		static let title = "YOUR RESULT"

		/// Пересчитать.
		static let recalculate = "RECALCULATE"
	}
}

/// Значения, используемые в приложении.
enum AppValues {

	// MARK: - Calculate values

	/// Значения для экрана расчета BMI.
	enum Calculate {

		/// Максимальное значение роста.
		///
		/// - Значение равно 3 (метра).
		static let maxHeight: Float = 3

		/// Начальное значение роста
		///
		/// - Значение равно 1.5 (метра)
		static let startHeight: Float = 1.5

		/// Максимальное значение веса
		///
		/// - Значение равно 200 (килограмм)
		static let maxWeight: Float = 200

		/// Начальное значение веса
		///
		/// - Значение равно 100 (килограмм)
		static let startWeight: Float = 100
	}
}
