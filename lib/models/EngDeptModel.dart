

class EngDeptModel {
  EngDeptModel({
    this.aerospace,
    this.agricultural,
    this.architecture,
    this.automotive,
    this.chemical,
    this.civil,
    this.computer,
    this.electrical,
    this.electronic,
    this.geoinformatics,
    this.geological,
    this.housing,
    this.industrial,
    this.mechanical,
    this.metallurgy,
    this.polymer,
    this.software,
    this.telecom,
    this.textile,
  });

  int aerospace;
  int agricultural;
  int architecture;
  int automotive;
  int chemical;
  int civil;
  int computer;
  int electrical;
  int electronic;
  int geoinformatics;
  int geological;
  int housing;
  int industrial;
  int mechanical;
  int metallurgy;
  int polymer;
  int software;
  int telecom;
  int textile;

  factory EngDeptModel.fromMap(Map<String, dynamic> json) => EngDeptModel(
        aerospace: json["Aerospace"],
        agricultural: json["Agricultural"],
        architecture: json["Architecture"],
        automotive: json["Automotive"],
        chemical: json["Chemical"],
        civil: json["Civil"],
        computer: json["Computer"],
        electrical: json["Electrical"],
        electronic: json["Electronic"],
        geoinformatics: json["Geoinformatics"],
        geological: json["Geological"],
        housing: json["Housing"],
        industrial: json["Industrial"],
        mechanical: json["Mechanical"],
        metallurgy: json["Metallurgy"],
        polymer: json["Polymer"],
        software: json["Software"],
        telecom: json["Telecom"],
        textile: json["Textile"],
      );

  // Map<String, dynamic> toMap() => {
  //     "Aerospace": aerospace,
  //     "Agricultural": agricultural,
  //     "Architecture": architecture,
  //     "Automotive": automotive,
  //     "Campuses": campuses,
  //     "Chemical": chemical,
  //     "Civil": civil,
  //     "Computer": computer,
  //     "Electrical": electrical,
  //     "Electronic": electronic,
  //     "Geoinformatics": geoinformatics,
  //     "Geological": geological,
  //     "Housing": housing,
  //     "Industrial": industrial,
  //     "Mechanical": mechanical,
  //     "Metallurgy": metallurgy,
  //     "Polymer": polymer,
  //     "Software": software,
  //     "Telecom": telecom,
  //     "Textile": textile,
  // };
}
