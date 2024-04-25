class ToDoDateUtil {
  ToDoDateUtil(
    this.todayDate,
  );

  DateTime todayDate = DateTime.now();
  final _months = {
    1: 'января',
    2: 'февраля',
    3: 'марта',
    4: 'апреля',
    5: 'мая',
    6: 'июня',
    7: 'июля',
    8: 'августа',
    9: 'сентября',
    10: 'октября',
    11: 'ноября',
    12: 'декабря',
  };

  get formattedDate => _getFormattedDate();

  _getFormattedDate() {
    return '${todayDate.day} ${_months[todayDate.month]} ${todayDate.year} года';
  }
}
