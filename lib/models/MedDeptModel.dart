class MedDeptModel {
  MedDeptModel({
    this.anaesthesiology,
    this.biotechnology,
    this.dentalSurgery,
    this.familyMedicine,
    this.generalSurgery,
    this.medicine,
    this.neurosurgery,
    this.obstetricsAndGynaecology,
    this.oncology,
    this.paediatrics,
    this.pathology,
    this.psychiatry,
    this.radiology,
    this.index,
  });

  int anaesthesiology;
  int biotechnology;
  int dentalSurgery;
  int familyMedicine;
  int generalSurgery;
  int medicine;
  int neurosurgery;
  int obstetricsAndGynaecology;
  int oncology;
  int paediatrics;
  int pathology;
  int psychiatry;
  int radiology;

  int index;

  factory MedDeptModel.fromMap(Map<String, dynamic> json) => MedDeptModel(
        anaesthesiology: json["Anaesthesiology"],
        biotechnology: json["Biotechnology"],
        dentalSurgery: json["Dental Surgery"],
        familyMedicine: json["Family Medicine"],
        generalSurgery: json["General Surgery"],
        medicine: json["Medicine"],
        neurosurgery: json["Neurosurgery"],
        obstetricsAndGynaecology: json["Obstetrics and Gynaecology"],
        oncology: json["Oncology"],
        paediatrics: json["Paediatrics"],
        pathology: json["Pathology"],
        psychiatry: json["Psychiatry"],
        radiology: json["Radiology"],
        index: json["index"],
      );

  Map<String, dynamic> toMap() => {
        "Anaesthesiology": anaesthesiology,
        "Biotechnology": biotechnology,
        "Dental Surgery": dentalSurgery,
        "Family Medicine": familyMedicine,
        "General Surgery": generalSurgery,
        "Medicine": medicine,
        "Neurosurgery": neurosurgery,
        "Obstetrics and Gynaecology": obstetricsAndGynaecology,
        "Oncology": oncology,
        "Paediatrics": paediatrics,
        "Pathology": pathology,
        "Psychiatry": psychiatry,
        "Radiology": radiology,
        "index": index,
      };
}
