Pacote criado para validar inscrições estaduais [2023]. Já atualizado para o Estado de Pernambuco.

Tendo em vista a necessidade de validação dos dados, o pacote aborda a temática da seguinte maneira:

Fica a cargo do desenvolvedor a maneira de obtenção os dados. Sendo necessário somente chamar a função [validaInscricaoEstadual] e nela passar como referência os dados: inscrição estadual (String) e o estado requerido. Neste estado, a fim de evitar incongruências, foi utilizado o enum, então será necessário somente escrever o Estado e selecionar a sigla do estado na lista que lhe aparecer.

O programa somente irá retornar true ou false. Sendo intuitivo, true para uma inscrição estadual válida, e false para inscrição estadual não válida.

Exemplo:

final inscricaoEstadual = InscricaoEstadual();

print(inscricaoEstadual.validaInscricaoEstadual(inscricaoEstadual: '8222310008332', sigla: Estados.MG));
// true

print(inscricaoEstadual.validaInscricaoEstadual(inscricaoEstadual: '8364357019828', sigla: Estados.MG));
// false


Matheus Toledo
Email: matheusjftoledo@gmail.com