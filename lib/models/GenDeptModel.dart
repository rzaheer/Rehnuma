class GenDeptModel {
  GenDeptModel({
    this.appliedChemistry,
    this.appliedPhysics,
    this.biochemistry,
    this.botany,
    this.business,
    this.commerce,
    this.criminology,
    this.distance,
    this.economics,
    this.education,
    this.foodScience,
    this.law,
    this.massCommunication,
    this.mathematics,
    this.microbiology,
    this.pharmaceutics,
    this.pharmacology,
    this.philosophy,
    this.physiology,
    this.politicalScience,
    this.psychology,
    this.sociology,
    this.specialEducation,
    this.visualStudies,
  });

  int appliedChemistry;
  int appliedPhysics;
  int biochemistry;
  int botany;
  int business;
  int commerce;
  int criminology;
  double distance;
  int economics;
  int education;
  int foodScience;
  int law;
  int massCommunication;
  int mathematics;
  int microbiology;
  int pharmaceutics;
  int pharmacology;
  int philosophy;
  int physiology;
  int politicalScience;
  int psychology;
  int sociology;
  int specialEducation;
  int visualStudies;

  factory GenDeptModel.fromMap(Map<String, dynamic> json) => GenDeptModel(
        appliedChemistry: json["Applied Chemistry"],
        appliedPhysics: json["Applied Physics"],
        biochemistry: json["Biochemistry"],
        botany: json["Botany"],
        business: json["Business"],
        commerce: json["Commerce"],
        criminology: json["Criminology"],
        distance: json["Distance"].toDouble(),
        economics: json["Economics"],
        education: json["Education"],
        foodScience: json["Food Science"],
        law: json["Law"],
        massCommunication: json["Mass Communication"],
        mathematics: json["Mathematics"],
        microbiology: json["Microbiology"],
        pharmaceutics: json["Pharmaceutics"],
        pharmacology: json["Pharmacology"],
        philosophy: json["Philosophy"],
        physiology: json["Physiology"],
        politicalScience: json["Political Science"],
        psychology: json["Psychology"],
        sociology: json["Sociology"],
        specialEducation: json["Special Education"],
        visualStudies: json["Visual Studies"],
      );
}
