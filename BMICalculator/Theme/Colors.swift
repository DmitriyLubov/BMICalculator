//
//  Colors.swift
//  BMICalculator
//
//  Created by Дмитрий Лубов on 07.06.2024.
//

import UIKit

/// Названия цветов из ассетов
enum ColorNames {

	/// Голубой
	static let cyanBlue = "cyan_blue_background"

	/// Зеленый
	static let green = "green_background"

	/// Розовый
	static let pink = "pink_background"

	/// Темно фиолетовый
	///
	/// - Непрозрачность 50%
	static let darkPurple = "dark_purple"
	
	/// Фиолетовый
	static let purple = "purple_purple"
}

/// Список цветор из ассетов
enum Colors {

	/// Голубой
	static let cyanBlue = UIColor(named: ColorNames.cyanBlue)!
	
	/// Зеленый
	static let green = UIColor(named: ColorNames.green)!
	
	/// Розовый
	static let pink = UIColor(named: ColorNames.pink)!

	/// Темно фиолетовый
	///
	/// - Непрозрачность 50%
	static let darkPurple = UIColor(named: ColorNames.darkPurple)!
	
	/// Фиолетовый
	static let purple = UIColor(named: ColorNames.purple)
}
