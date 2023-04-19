import 'package:flutter_test/flutter_test.dart';

import 'package:inscricao_estadual/inscricao_estadual.dart';

void main() {
  test('adds one to input values', () {
    final ie = InscricaoEstadual();
    expect(ie.validaInscricaoEstadual(inscricaoEstadual: '8222310008332', sigla: Estados.MG),
        true);
    expect(ie.validaInscricaoEstadual(inscricaoEstadual: '8364357019829', sigla: Estados.MG),
        true);
    expect(ie.validaInscricaoEstadual(inscricaoEstadual: '8364357019828', sigla: Estados.MG),
        false);
  });
}
