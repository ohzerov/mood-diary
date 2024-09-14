// ignore_for_file: public_member_api_docs, sort_constructors_first
class Mood {
  String iconPath;
  String name;

  List<String> feelings;
  List<int> selectedSubFeelings;

  Mood(
      {required this.iconPath,
      required this.name,
      required this.feelings,
      required this.selectedSubFeelings});
}

List<Mood> moods = [
  Mood(
    iconPath: 'assets/icons/joy_icon.png',
    name: 'Радость',
    feelings: [
      'Возбуждение',
      'Восторг',
      'Игривость',
      'Наслаждение',
      'Очарование',
      'Осознанность',
      'Смелость',
      'Удовольствие',
      'Чувственность',
      'Энергичность',
      'Экстравагантность'
    ],
    selectedSubFeelings: [],
  ),
  Mood(
    iconPath: 'assets/icons/fear_icon.png',
    name: 'Страх',
    feelings: [
      'Депрессия',
      'Тревога',
      'Неуверенность',
      'Нервозность',
      'Паника',
      'Одиночество',
      'Опасение',
    ],
    selectedSubFeelings: [],
  ),
  Mood(
    iconPath: 'assets/icons/rage_icon.png',
    name: 'Бешенство',
    feelings: [
      'Возбуждение',
      'Ярость',
      'Ненависть',
      'Гнев',
      'Раздражение',
      'Агрессия',
      'Ненависть',
      'Недовольство',
      'Беспокойство',
      'Буря',
      'Месть',
    ],
    selectedSubFeelings: [],
  ),
  Mood(
    iconPath: 'assets/icons/sadness_icon.png',
    name: 'Грусть',
    feelings: [
      'Печаль',
      'Скука',
      'Уныние',
      'Тоска',
      'Одиночество',
      'Сожаление',
      'Тревога',
      'Нежность',
      'Меланхолия',
      'Безнадежность',
      'Смирение',
    ],
    selectedSubFeelings: [],
  ),
  Mood(
    iconPath: 'assets/icons/calm_icon.png',
    name: 'Спокойствие',
    feelings: [
      'Успокоение',
      'Расслабление',
      'Гармония',
      'Нежность',
      'Покой',
      'Согласие',
      'Тишина',
      'Уют',
      'Благополучие',
      'Стабильность',
      'Довольство',
    ],
    selectedSubFeelings: [],
  ),
  Mood(
    iconPath: 'assets/icons/strength_icon.png',
    name: 'Сила',
    feelings: [
      'Энергия',
      'Мощь',
      'Самоуверенность',
      'Стойкость',
      'Вдохновение',
      'Мотивация',
      'Твёрдость',
      'Отвага',
      'Оптимизм',
      'Устойчивость',
      'Динамичность',
    ],
    selectedSubFeelings: [],
  ),
];
