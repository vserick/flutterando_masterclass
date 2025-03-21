import 'dart:io';

void main() {
  final env = DotEnv('.env');
  print(env.getValue('URL_API') == 'https://api.github.com');

  print(env.getValue('API_TOKEN') == 'kdjhgfkadhjsgflkdhjsgl');
}

class DotEnv {
  final String _path;
  final Map<String, dynamic> _env = {};

  DotEnv(this._path) {
    _load();
  }

  void _load() {
    final arq = File(_path);

    // validar se o caminho existe.
    if (!arq.existsSync()) {
      throw Exception('Caminho informado não existe');
    }

    // ler o arquivo, separado por linhas.
    List<String> lines =  arq.readAsLinesSync();

    // separar por chave e valor
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      final key = line.substring(0, line.indexOf('='));
      final dynamic value = line.substring(line.indexOf('=') + 1, line.length);

      // atribuir ao map
      _env.addAll({key: value});
    }
  }

  dynamic getValue(String key) {
    return _env[key];
  }
}
