// ignore_for_file: constant_identifier_names

import 'package:inscricao_estadual/src/incricao_estadual_individual.dart';

enum Estados {
  AC,
  AL,
  AM,
  AP,
  BA,
  CE,
  DF,
  ES,
  GO,
  MA,
  MG,
  MS,
  MT,
  PA,
  PB,
  PE,
  PI,
  PR,
  RJ,
  RN,
  RO,
  RR,
  RS,
  SE,
  SC,
  SP,
  TO
}

class InscricaoEstadual {
  bool validaInscricaoEstadual({required String inscricaoEstadual, required Estados sigla}) {
    
    final inscricaoEstadualIndividual = InscricaoEstadualIndividual();
      
    
    switch (sigla) {
      case Estados.AC:
        return inscricaoEstadualIndividual.validaIEAcre(inscricaoEstadual);
      case Estados.AL:
        return inscricaoEstadualIndividual.validaIEAlagoas(inscricaoEstadual);
      case Estados.AM:
        return inscricaoEstadualIndividual.validaIEAmazonas(inscricaoEstadual);
      case Estados.AP:
        return inscricaoEstadualIndividual.validaIEAmapa(inscricaoEstadual);
      case Estados.BA:
        return inscricaoEstadualIndividual.validaIEBahia(inscricaoEstadual);
      case Estados.CE:
        return inscricaoEstadualIndividual.validaIECeara(inscricaoEstadual);
      case Estados.DF:
        return inscricaoEstadualIndividual.validaIEDistritoFederal(inscricaoEstadual);
      case Estados.ES:
        return inscricaoEstadualIndividual.validaIEEspiritoSanto(inscricaoEstadual);
      case Estados.GO:
        return inscricaoEstadualIndividual.validaIEGoias(inscricaoEstadual);
      case Estados.MA:
        return inscricaoEstadualIndividual.validaIEMaranhao(inscricaoEstadual);
      case Estados.MG:
        return inscricaoEstadualIndividual.validaIEMinasGerais(inscricaoEstadual);
      case Estados.MS:
        return inscricaoEstadualIndividual.validaIEMatoGrossoSul(inscricaoEstadual);
      case Estados.MT:
        return inscricaoEstadualIndividual.validaIEMatoGrosso(inscricaoEstadual);
      case Estados.PA:
        return inscricaoEstadualIndividual.validaIEPara(inscricaoEstadual);
      case Estados.PB:
        return inscricaoEstadualIndividual.validaIEParaiba(inscricaoEstadual);
      case Estados.PI:
        return inscricaoEstadualIndividual.validaIEPiaui(inscricaoEstadual);
      case Estados.PE:
        return inscricaoEstadualIndividual.validaIEPernambuco(inscricaoEstadual);
      case Estados.PR:
        return inscricaoEstadualIndividual.validaIEParana(inscricaoEstadual);
      case Estados.RJ:
        return inscricaoEstadualIndividual.validaIERioJaneiro(inscricaoEstadual);
      case Estados.RN:
        return inscricaoEstadualIndividual.validaIERioGrandeNorte(inscricaoEstadual);
      case Estados.RO:
        return inscricaoEstadualIndividual.validaIERondonia(inscricaoEstadual);
      case Estados.RR:
        return inscricaoEstadualIndividual.validaIERoraima(inscricaoEstadual);
      case Estados.RS:
        return inscricaoEstadualIndividual.validaIERioGrandeSul(inscricaoEstadual);
      case Estados.SE:
        return inscricaoEstadualIndividual.validaIESergipe(inscricaoEstadual);
      case Estados.SC:
        return inscricaoEstadualIndividual.validaIESantaCatarina(inscricaoEstadual);
      case Estados.SP:
        return inscricaoEstadualIndividual.validaIESaoPaulo(inscricaoEstadual);
      case Estados.TO:
        return inscricaoEstadualIndividual.validaIETocantins(inscricaoEstadual);

      default:
        return false;
    }
  }
}


