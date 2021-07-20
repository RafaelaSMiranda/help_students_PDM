class Tarefa {
  static const String cooking = 'cooking';
  static const String hiking = 'hiking';
  static const String traveling = 'traveling';

  String materia = '';
  String tarefa = '';
  String data = '';

  bool newsletter = false;

  Map passions = {cooking: false, hiking: false, traveling: false};

  save() {
    print('A sua tarefa está sendo salva ...');
  }
}
