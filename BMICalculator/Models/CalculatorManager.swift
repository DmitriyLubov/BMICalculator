//
//  CalculatorManager.swift
//  BMICalculator
//
//  Created by Дмитрий Лубов on 09.06.2024.
//

import Foundation

/// Калькулятор BMI
struct CalculatorManager {

	// MARK: - Private properties

	private var bmi: BMI?
	
	// MARK: - Public methods
	
	/// Предоставляет информацию об индексе массы тела в виде модели BMI
	///
	/// Если BMI не расcчитан, то возвращает `CalculatorManager.bmiStub`
	/// - Returns: модель BMI
	func getBMI() -> BMI {
		bmi ?? CalculatorManager.bmiStub
	}
	
	/// Рассчет BMI
	/// - Parameters:
	///   - height: рост
	///   - weight: вес
	mutating func calculate(height: Double, weight: Double) {
		let value = weight / pow(height, 2)

		switch value {
		case 0..<18.5:
			bmi = BMI(value: value, advice: Category.underWeight.advice, color: Category.underWeight.color)
		case 18.5...24.9:
			bmi = BMI(value: value, advice: Category.normal.advice, color: Category.normal.color)
		case 25...:
			bmi = BMI(value: value, advice: Category.overWeight.advice, color: Category.overWeight.color)
		default:
			bmi = nil
		}
	}
}

// MARK: - Stub BMI

extension CalculatorManager {

	/// Заглушка `BMI(value: 0.0, advice: "No advice", color: "white")`
	static let bmiStub = BMI(value: 0.0, advice: "No advice", color: ColorNames.gray)
}

// MARK: - BMI Categories

private extension CalculatorManager {

	enum Category {

		case underWeight
		case normal
		case overWeight

		var advice: String {
			switch self {
			case .underWeight:
				Naming.Advices.underWeight
			case .normal:
				Naming.Advices.normal
			case .overWeight:
				Naming.Advices.overWeight
			}
		}

		var color: String {
			switch self {
			case .underWeight:
				ColorNames.cyanBlue
			case .normal:
				ColorNames.green
			case .overWeight:
				ColorNames.pink
			}
		}
	}
}
