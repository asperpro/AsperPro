//
//  CountriesTVC.swift
//  AsperPro
//
//  Created by didarkam on 7/16/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation
import UIKit


class CountriesTVC: UITableViewController {
    
    let countries = ["Австралия",
                     "Австрия",
                     "Азербайджан",
                     "Аландские острова",
                     "Албания",
                     "Алжир",
                     "Ангилья",
                     "Ангола",
                     "Андорра",
                     "Аргентина",
                     "Армения",
                     "Афганистан",
                     "Бангладеш",
                     "Барбадос",
                     "Бахрейн",
                     "Белиз",
                     "Белоруссия",
                     "Бельгия",
                     "Бенин",
                     "Болгария",
                     "Боливия",
        "Босния и Герцеговина",
        "Бразилия",
        "Бруней",
        "Ватикан",
        "Великобритания",
        "Венгрия",
        "Венесуэла",
        "Вьетнам",
        "Гаити",
        "Гамбия",
        "Гана",
        "Гваделупа",
        "Гватемала",
        "Гвинея",
        "Германия",
        "Гондурас",
        "Гонконг",
        "Гренада",
        "Гренландия",
        "Греция",
        "Грузия",
        "Дания",
        "ДР Конго",
        "Доминика",
        "Доминиканская Республика",
        "Египет",
        "Замбия",
        "Зимбабве",
        "Израиль",
        "Индия",
        "Индонезия",
        "Иордания",
        "Ирак",
        "Иран",
        "Ирландия",
        "Исландия",
        "Испания",
        "Италия",
        "Йемен",
        "КНДР",
        "Казахстан",
        "Камбоджа",
        "Камерун",
        "Канада",
        "Катар",
        "Кения",
        "Кипр",
        "Киргизия",
        "Кирибати",
        "КНР",
        "Колумбия",
        "Коморы",
        "Коста-Рика",
        "Кот-д’Ивуар",
        "Куба",
        "Кувейт",
        "Латвия",
        "Либерия",
        "Ливан",
        "Ливия",
        "Литва",
        "Лихтенштейн",
        "Люксембург",
        "Республика Македония",
        "Малайзия",
        "Марокко",
        "Мартиника",
        "Маршалловы Острова",
        "Мексика",
        "Мозамбик",
        "Молдавия",
        "Монако",
        "Монголия",
        "Непал",
        "Нигер",
        "Нигерия",
        "Нидерланды",
        "Новая Зеландия",
        "Норвегия",
        "ОАЭ",
        "Оман",
        "Пакистан",
        "Палестина",
        "Парагвай",
        "Перу",
        "Польша",
        "Португалия",
        "Республика Конго",
        "Россия",
        "Румыния",
        "США",
        "Саудовская Аравия",
        "Сенегал",
        "Сербия",
        "Сингапур",
        "Сирия",
        "Словакия",
        "Словения",
        "Сомали",
        "Судан",
        "Таджикистан",
        "Таиланд",
        "Китайская Республика",
        "Танзания",
        "Тонга",
        "Тринидад и Тобаго",
        "Тувалу",
        "Тунис",
        "Туркмения",
        "Турция",
        "Уганда",
        "Узбекистан",
        "Украина",
        "Уругвай",
        "Филиппины",
        "Финляндия",
        "Франция",
        "Хорватия",
        "Черногория",
        "Чехия",
        "Чили",
        "Швейцария",
        "Швеция",
        "Шри-Ланка",
        "Эквадор",
        "Эстония",
        "Эфиопия",
        "ЮАР",
        "Республика Корея",
        "Ямайка",
        "Япония"]
    
    let cellId = "cellId"
    
    var didChoseCountryName: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) //as! UITableViewCell
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didChoseCountryName?(countries[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}
