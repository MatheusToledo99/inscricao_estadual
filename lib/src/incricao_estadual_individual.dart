class InscricaoEstadualIndividual {
  
    bool validaIEAcre(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 13) {
      return false;
    }

    for (int i = 0; i < 2; i++) {
      if (int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) !=
          i) {
        return false;
      }
    }

    int soma = 0;
    int pesoInicial = 4;
    int pesoFinal = 9;
    int d1 = 0;
    int d2 = 0;

    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      if (i < 3) {
        soma +=
            int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
                pesoInicial;
        pesoInicial--;
      } else {
        soma +=
            int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
                pesoFinal;
        pesoFinal--;
      }
    }
    d1 = 11 - (soma % 11);
    if (d1 == 10 || d1 == 11) {
      d1 = 0;
    }

    soma = d1 * 2;
    pesoInicial = 5;
    pesoFinal = 9;
    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      if (i < 4) {
        soma +=
            int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
                pesoInicial;
        pesoInicial--;
      } else {
        soma +=
            int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
                pesoFinal;
        pesoFinal--;
      }
    }

    d2 = 11 - (soma % 11);
    if (d2 == 10 || d2 == 11) {
      d2 = 0;
    }

    String dv = "$d1$d2";
    if (dv !=
        inscricaoEstadual.substring(
            inscricaoEstadual.length - 2, inscricaoEstadual.length)) {
      return false;
    }
    return true;
  }

  bool validaIEAlagoas(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    if (inscricaoEstadual.substring(0, 2) != '24') {
      return false;
    }

    List<int> digits = [0, 3, 5, 7, 8];
    bool check = false;
    for (int i = 0; i < digits.length; i++) {
      if (int.parse(inscricaoEstadual[2]) == digits[i]) {
        check = true;
        break;
      }
    }
    if (!check) {
      return false;
    }

    int soma = 0;
    int peso = 9;
    int d = 0;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }
    d = ((soma * 10) % 11);
    if (d == 10) {
      d = 0;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIEAmazonas(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    int soma = 0;
    int peso = 9;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    if (soma < 11) {
      d = 11 - soma;
    } else if ((soma % 11) <= 1) {
      d = 0;
    } else {
      d = 11 - (soma % 11);
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIEAmapa(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    if (inscricaoEstadual.substring(0, 2) != "03") {
      return false;
    }

    int d1 = -1;
    int soma = -1;
    int peso = 9;

    int x =
        int.parse(inscricaoEstadual.substring(0, inscricaoEstadual.length - 1));
    if (x >= 3017001 && x <= 3019022) {
      d1 = 1;
      soma = 9;
    } else if (x >= 3000001 && x <= 3017000) {
      d1 = 0;
      soma = 5;
    } else if (x >= 3019023) {
      d1 = 0;
      soma = 0;
    }

    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    int d = 11 - (soma % 11);
    if (d == 10) {
      d = 0;
    } else if (d == 11) {
      d = d1;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIEBahia(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 8 && inscricaoEstadual.length != 9) {
      return false;
    }

    int modulo = 10;
    int firstDigit = int.parse(String.fromCharCode(
        inscricaoEstadual.codeUnitAt(inscricaoEstadual.length == 8 ? 0 : 1)));
    if (firstDigit == 6 || firstDigit == 7 || firstDigit == 9) modulo = 11;

    int d2 = -1;
    int soma = 0;
    int peso = inscricaoEstadual.length == 8 ? 7 : 8;
    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      soma += int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
          peso;
      peso--;
    }

    int resto = soma % modulo;

    if (resto == 0 || (modulo == 11 && resto == 1)) {
      d2 = 0;
    } else {
      d2 = modulo - resto;
    }

    int d1 = -1;
    soma = d2 * 2;
    peso = inscricaoEstadual.length == 8 ? 8 : 9;

    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    resto = soma % modulo;

    if (resto == 0 || (modulo == 11 && resto == 1)) {
      d1 = 0;
    } else {
      d1 = modulo - resto;
    }

    String dv = "$d1$d2";
    if (dv != inscricaoEstadual.substring(inscricaoEstadual.length - 2)) {
      return false;
    }
    return true;
  }

  bool validaIECeara(String inscricaoEstadual) {
    //valida quantida de d&#65533;gitos
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    int soma = 0;
    int peso = 9;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    d = 11 - (soma % 11);
    if (d == 10 || d == 11) {
      d = 0;
    }
    //valida o digito verificador
    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIEDistritoFederal(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 13) {
      return false;
    }

    int soma = 0;
    int pesoInicio = 4;
    int pesoFim = 9;
    int d1 = -1;
    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      if (i < 3) {
        soma += int.parse(inscricaoEstadual[i]) * pesoInicio;
        pesoInicio--;
      } else {
        soma += int.parse(inscricaoEstadual[i]) * pesoFim;
        pesoFim--;
      }
    }

    d1 = 11 - (soma % 11);
    if (d1 == 11 || d1 == 10) {
      d1 = 0;
    }

    soma = d1 * 2;
    pesoInicio = 5;
    pesoFim = 9;
    int d2 = -1;
    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      if (i < 4) {
        soma += int.parse(inscricaoEstadual[i]) * pesoInicio;
        pesoInicio--;
      } else {
        soma += int.parse(inscricaoEstadual[i]) * pesoFim;
        pesoFim--;
      }
    }

    d2 = 11 - (soma % 11);
    if (d2 == 11 || d2 == 10) {
      d2 = 0;
    }

    String dv = "$d1$d2";
    if (dv !=
        inscricaoEstadual.substring(
            inscricaoEstadual.length - 2, inscricaoEstadual.length)) {
      return false;
    }
    return true;
  }

  bool validaIEEspiritoSanto(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }
    int soma = 0;
    int peso = 9;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    int resto = soma % 11;
    if (resto < 2) {
      d = 0;
    } else if (resto > 1) {
      d = 11 - resto;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIEGoias(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    if (inscricaoEstadual.substring(0, 2) != "10") {
      if (inscricaoEstadual.substring(0, 2) != "11") {
        if (inscricaoEstadual.substring(0, 2) != "15") {
          return false;
        }
      }
    }

    if (inscricaoEstadual.substring(0, inscricaoEstadual.length - 1) ==
        "11094402") {
      if (inscricaoEstadual.substring(
              inscricaoEstadual.length - 1, inscricaoEstadual.length) !=
          "0") {
        if (inscricaoEstadual.substring(
                inscricaoEstadual.length - 1, inscricaoEstadual.length) !=
            "1") {
          return false;
        }
      }
    } else {
      int soma = 0;
      int peso = 9;
      int d = -1;
      for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
        soma += int.parse(inscricaoEstadual[i]) * peso;
        peso--;
      }
      int resto = soma % 11;
      int faixaInicio = 10103105;
      int faixaFim = 10119997;
      int insc = int.parse(
          inscricaoEstadual.substring(0, inscricaoEstadual.length - 1));
      if (resto == 0) {
        d = 0;
      } else if (resto == 1) {
        if (insc >= faixaInicio && insc <= faixaFim) {
          d = 1;
        } else {
          d = 0;
        }
      } else if (resto != 0 && resto != 1) {
        d = 11 - resto;
      }

      String dv = d.toString();
      if (inscricaoEstadual.substring(
              inscricaoEstadual.length - 1, inscricaoEstadual.length) !=
          dv) {
        return false;
      }
    }
    return true;
  }

  bool validaIEMaranhao(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    if (inscricaoEstadual.substring(0, 2) != "12") {
      return false;
    }

    int soma = 0;
    int peso = 9;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    d = 11 - (soma % 11);
    if ((soma % 11) == 0 || (soma % 11) == 1) {
      d = 0;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIEMatoGrosso(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 11) {
      return false;
    }

    int soma = 0;
    int pesoInicial = 3;
    int pesoFinal = 9;
    int d = -1;

    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      if (i < 2) {
        soma += int.parse(inscricaoEstadual[i]) * pesoInicial;
        pesoInicial--;
      } else {
        soma += int.parse(inscricaoEstadual[i]) * pesoFinal;
        pesoFinal--;
      }
    }

    d = 11 - (soma % 11);
    if ((soma % 11) == 0 || (soma % 11) == 1) {
      d = 0;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIEMatoGrossoSul(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    if (inscricaoEstadual.substring(0, 2) != "28") {
      return false;
    }

    int soma = 0;
    int peso = 9;
    int d = -1; //dígito verificador
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
          peso;
      peso--;
    }

    int resto = soma % 11;
    int result = 11 - resto;
    if (resto == 0) {
      d = 0;
    } else if (resto > 0) {
      if (result > 9) {
        d = 0;
      } else if (result < 10) {
        d = result;
      }
    }

//valida o digito verificador
    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIEMinasGerais(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 13) {
      return false;
    }
    String str = "";
    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      // if (ie[i].isDigit()) {
      if (i == 3) {
        str += "0";
        str += inscricaoEstadual[i];
      } else {
        str += inscricaoEstadual[i];
      }
      // }
    }
    int soma = 0;
    int pesoInicio = 1;
    int pesoFim = 2;
    int d1 = -1;
    for (int i = 0; i < str.length; i++) {
      if (i % 2 == 0) {
        int x = int.parse(str[i]) * pesoInicio;
        String strX = x.toString();
        for (int j = 0; j < strX.length; j++) {
          soma += int.parse(strX[j]);
        }
      } else {
        int y = int.parse(str[i]) * pesoFim;
        String strY = y.toString();
        for (int j = 0; j < strY.length; j++) {
          soma += int.parse(strY[j]);
        }
      }
    }
    int dezenaExata = soma;
    while (dezenaExata % 10 != 0) {
      dezenaExata++;
    }
    d1 = dezenaExata - soma;
    soma = d1 * 2;
    pesoInicio = 3;
    pesoFim = 11;
    int d2 = -1;
    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      if (i < 2) {
        soma += int.parse(inscricaoEstadual[i]) * pesoInicio;
        pesoInicio--;
      } else {
        soma += int.parse(inscricaoEstadual[i]) * pesoFim;
        pesoFim--;
      }
    }
    d2 = 11 - (soma % 11);
    if ((soma % 11 == 0) || (soma % 11 == 1)) {
      d2 = 0;
    }
    String dv = d1.toString() + d2.toString();
    if (dv != inscricaoEstadual.substring(inscricaoEstadual.length - 2)) {
      return false;
    }

    return true;
  }

  bool validaIEPara(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    if (inscricaoEstadual.substring(0, 2) != "15") {
      return false;
    }

    int soma = 0;
    int peso = 9;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    d = 11 - (soma % 11);
    if ((soma % 11) == 0 || (soma % 11) == 1) {
      d = 0;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(
            inscricaoEstadual.length - 1, inscricaoEstadual.length) !=
        dv) {
      return false;
    }
    return true;
  }

  bool validaIEParana(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 10) {
      return false;
    }

    int soma = 0;
    int pesoInicio = 3;
    int pesoFim = 7;
    int d1 = -1;
    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      if (i < 2) {
        soma += int.parse(inscricaoEstadual[i]) * pesoInicio;
        pesoInicio--;
      } else {
        soma += int.parse(inscricaoEstadual[i]) * pesoFim;
        pesoFim--;
      }
    }

    d1 = 11 - (soma % 11);
    if ((soma % 11) == 0 || (soma % 11) == 1) {
      d1 = 0;
    }

    soma = d1 * 2;
    pesoInicio = 4;
    pesoFim = 7;
    int d2 = -1;
    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      if (i < 3) {
        soma += int.parse(inscricaoEstadual[i]) * pesoInicio;
        pesoInicio--;
      } else {
        soma += int.parse(inscricaoEstadual[i]) * pesoFim;
        pesoFim--;
      }
    }

    d2 = 11 - (soma % 11);
    if ((soma % 11) == 0 || (soma % 11) == 1) {
      d2 = 0;
    }

    String dv = "$d1$d2";
    if (dv != inscricaoEstadual.substring(inscricaoEstadual.length - 2)) {
      return false;
    }
    return true;
  }

  bool validaIEParaiba(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    int soma = 0;
    int peso = 9;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
          peso;
      peso--;
    }

    d = 11 - (soma % 11);
    if (d == 10 || d == 11) {
      d = 0;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIEPernambuco(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    int soma = 0;
    int pesoInicio = 8;
    int pesoFim = 2;
    int d1 = -1;
    int d2 = -1;

    for (int i = 0; i < inscricaoEstadual.length - 2; i++) {
      if (i < 8) {
        soma += int.parse(inscricaoEstadual[i]) * pesoInicio;
        pesoInicio--;
      } else {
        soma += int.parse(inscricaoEstadual[i]) * pesoFim;
        pesoFim--;
      }
    }

    if (soma % 11 == 1 || soma % 11 == 0) {
      d1 = 0;
    } else {
      d1 = 11 - (soma % 11);
    }

    int segundoPeso = 9;
    int adicao = 0;

    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      adicao += int.parse(inscricaoEstadual[i]) * segundoPeso;

      segundoPeso--;
    }

    if (adicao % 11 == 1 || adicao % 11 == 0) {
      d2 = 0;
    } else {
      d2 = 11 - (adicao % 11);
    }

    String dv = "$d1$d2";
    if (dv !=
        inscricaoEstadual.substring(
            inscricaoEstadual.length - 2, inscricaoEstadual.length)) {
      return false;
    }
    return true;
  }

  bool validaIEPiaui(String inscricaoEstadual) {
    //valida quantida de dígitos
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    //Cálculo do dígito verificador
    int soma = 0;
    int peso = 9;
    int d = -1; //dígito verificador
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    d = 11 - (soma % 11);
    if (d == 11 || d == 10) {
      d = 0;
    }

    //valida o digito verificador
    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIERioGrandeNorte(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 10 && inscricaoEstadual.length != 9) {
      return false;
    }

    if (inscricaoEstadual.substring(0, 2) != '20') {
      return false;
    }

    if (inscricaoEstadual.length == 9) {
      var soma = 0;
      var peso = 9;
      var d = -1; // dígito verificador
      for (var i = 0; i < inscricaoEstadual.length - 1; i++) {
        soma += int.parse(inscricaoEstadual[i]) * peso;
        peso--;
      }
      d = ((soma * 10) % 11);
      if (d == 10) {
        d = 0;
      }

      var dv = d.toString();
      if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
        return false;
      }
    } else {
      var soma = 0;
      var peso = 10;
      var d = -1; // dígito verificador
      for (var i = 0; i < inscricaoEstadual.length - 1; i++) {
        soma += int.parse(inscricaoEstadual[i]) * peso;
        peso--;
      }
      d = ((soma * 10) % 11);
      if (d == 10) {
        d = 0;
      }
      var dv = d.toString();
      if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
        return false;
      }
    }
    return true;
  }

  bool validaIERioGrandeSul(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 10) {
      return false;
    }

    int soma = int.parse(inscricaoEstadual[0]) * 2;
    int peso = 9;
    int d = -1;
    for (int i = 1; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    d = 11 - (soma % 11);
    if (d == 10 || d == 11) {
      d = 0;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIERioJaneiro(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 8) {
      return false;
    }

    int soma = 0;
    int peso = 7;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      if (i == 0) {
        soma += int.parse(inscricaoEstadual[i]) * 2;
      } else {
        soma += int.parse(inscricaoEstadual[i]) * peso;
        peso--;
      }
    }

    d = 11 - (soma % 11);
    if ((soma % 11) <= 1) {
      d = 0;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIERondonia(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 14) {
      return false;
    }

    int soma = 0;
    int pesoInicio = 6;
    int pesoFim = 9;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      if (i < 5) {
        soma += int.parse(inscricaoEstadual[i]) * pesoInicio;
        pesoInicio--;
      } else {
        soma += int.parse(inscricaoEstadual[i]) * pesoFim;
        pesoFim--;
      }
    }

    d = 11 - (soma % 11);
    if (d == 11 || d == 10) {
      d -= 10;
    }

    String dv = d.toString();
    if (inscricaoEstadual[inscricaoEstadual.length - 1] != dv) {
      return false;
    }
    return true;
  }

  bool validaIERoraima(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    if (inscricaoEstadual.substring(0, 2) != "24") {
      return false;
    }

    int soma = 0;
    int peso = 1;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso++;
    }

    d = soma % 9;

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIESantaCatarina(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }
    int soma = 0;
    int peso = 9;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    d = 11 - (soma % 11);
    if ((soma % 11) == 0 || (soma % 11) == 1) {
      d = 0;
    }

    String dv = "$d";
    if (dv != inscricaoEstadual.substring(inscricaoEstadual.length - 1)) {
      return false;
    }
    return true;
  }

  bool validaIESaoPaulo(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 12 && inscricaoEstadual.length != 13) {
      return false;
    }

    if (inscricaoEstadual.length == 12) {
      int soma = 0;
      int peso = 1;
      int d1 = -1;
      for (int i = 0; i < inscricaoEstadual.length - 4; i++) {
        if (i == 1 || i == 7) {
          soma +=
              int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
                  ++peso;
          peso++;
        } else {
          soma +=
              int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
                  peso;
          peso++;
        }
      }
      d1 = soma % 11;
      String strD1 = d1.toString();
      d1 = int.parse(String.fromCharCode(strD1.codeUnitAt(strD1.length - 1)));

      soma = 0;
      int pesoInicio = 3;
      int pesoFim = 10;
      int d2 = -1;
      for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
        if (i < 2) {
          soma +=
              int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
                  pesoInicio;
          pesoInicio--;
        } else {
          soma +=
              int.parse(String.fromCharCode(inscricaoEstadual.codeUnitAt(i))) *
                  pesoFim;
          pesoFim--;
        }
      }

      d2 = soma % 11;
      String strD2 = d2.toString();
      d2 = int.parse(String.fromCharCode(strD2.codeUnitAt(strD2.length - 1)));

      if (inscricaoEstadual.substring(8, 9) != d1.toString()) {
        return false;
      }
      if (inscricaoEstadual.substring(11, 12) != d2.toString()) {
        return false;
      }
    } else {
      if (inscricaoEstadual[0] != 'P') {
        return false;
      }
      String strIE = inscricaoEstadual.substring(1, 10);
      int soma = 0;
      int peso = 1;
      int d1 = -1;

      for (int i = 0; i < strIE.length - 1; i++) {
        if (i == 1 || i == 7) {
          soma += int.parse(String.fromCharCode(strIE.codeUnitAt(i))) * ++peso;
          peso++;
        } else {
          soma += int.parse(String.fromCharCode(strIE.codeUnitAt(i))) * peso;
          peso++;
        }
      }

      d1 = soma % 11;
      String strD1 = d1.toString();
      d1 = int.parse(String.fromCharCode(strD1.codeUnitAt(strD1.length - 1)));

      if (inscricaoEstadual.substring(9, 10) != d1.toString()) {
        return false;
      }
    }
    return true;
  }

  bool validaIESergipe(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9) {
      return false;
    }

    int soma = 0;
    int peso = 9;
    int d = -1;
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      soma += int.parse(inscricaoEstadual[i]) * peso;
      peso--;
    }

    d = 11 - (soma % 11);
    if (d == 11 || d == 11 || d == 10) {
      d = 0;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }

  bool validaIETocantins(String inscricaoEstadual) {
    if (inscricaoEstadual.length != 9 && inscricaoEstadual.length != 11) {
      return false;
    } else if (inscricaoEstadual.length == 9) {
      inscricaoEstadual =
          "${inscricaoEstadual.substring(0, 2)}02${inscricaoEstadual.substring(2)}";
    }

    int soma = 0;
    int peso = 9;
    int d = -1; // dígito verificador
    for (int i = 0; i < inscricaoEstadual.length - 1; i++) {
      if (i != 2 && i != 3) {
        soma += int.parse(inscricaoEstadual[i]) * peso;
        peso--;
      }
    }

    d = 11 - (soma % 11);
    if ((soma % 11) < 2) {
      d = 0;
    }

    String dv = d.toString();
    if (inscricaoEstadual.substring(inscricaoEstadual.length - 1) != dv) {
      return false;
    }
    return true;
  }
  
}

