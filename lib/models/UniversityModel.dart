class UniversityModel {
  UniversityModel({
    this.academicStaff,
    this.appliedChemistry,
    this.appliedPhysics,
    this.balochistan,
    this.biochemistry,
    this.botany,
    this.business,
    this.campuses,
    this.commerce,
    this.criminology,
    this.distanceKmFromCentral,
    this.economics,
    this.education,
    this.federal,
    this.femaleNonPhD,
    this.femalePhD,
    this.financialAid,
    this.foodScience,
    this.grandTotal,
    this.hec,
    this.housing,
    this.institutionalAccreditation,
    this.islamabad,
    this.islamicStudies,
    this.kpk,
    this.karachi,
    this.lahore,
    this.law,
    this.location,
    this.maleNonPhD,
    this.malePhD,
    this.maleToFemaleRatio,
    this.massCommunication,
    this.mathematics,
    this.microbiology,
    this.pec,
    this.pmdc,
    this.peshawar,
    this.pharmaceutics,
    this.pharmacology,
    this.philosophy,
    this.physiology,
    this.politicalScience,
    this.postgraduateFees,
    this.private,
    this.province,
    this.psychology,
    this.public,
    this.punjab,
    this.sindh,
    this.sociology,
    this.specialEducation,
    this.studentToFacultyRatio,
    this.studentsEnrolled,
    this.undergraduateFees,
    this.university,
    this.unnamed0,
    this.visualStudies,
    this.years,
    this.index,
  });

  int academicStaff;
  int appliedChemistry;
  int appliedPhysics;
  int balochistan;
  int biochemistry;
  int botany;
  int business;
  String campuses;
  int commerce;
  int criminology;
  double distanceKmFromCentral;
  int economics;
  int education;
  int federal;
  int femaleNonPhD;
  int femalePhD;
  int financialAid;
  int foodScience;
  int grandTotal;
  int hec;
  int housing;
  String institutionalAccreditation;
  int islamabad;
  int islamicStudies;
  int kpk;
  int karachi;
  int lahore;
  int law;
  String location;
  int maleNonPhD;
  int malePhD;
  double maleToFemaleRatio;
  int massCommunication;
  int mathematics;
  int microbiology;
  int pec;
  int pmdc;
  int peshawar;
  int pharmaceutics;
  int pharmacology;
  int philosophy;
  int physiology;
  int politicalScience;
  int postgraduateFees;
  int private;
  String province;
  int psychology;
  int public;
  int punjab;
  int sindh;
  int sociology;
  int specialEducation;
  int studentToFacultyRatio;
  int studentsEnrolled;
  int undergraduateFees;
  String university;
  int unnamed0;
  int visualStudies;
  int years;
  int index;

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        academicStaff: json["Academic Staff"],
        appliedChemistry: json["Applied Chemistry"],
        appliedPhysics: json["Applied Physics"],
        balochistan: json["Balochistan"],
        biochemistry: json["Biochemistry"],
        botany: json["Botany"],
        business: json["Business"],
        campuses: json["Campuses"],
        commerce: json["Commerce"],
        criminology: json["Criminology"],
        distanceKmFromCentral: json["Distance km (From Central)"].toDouble(),
        economics: json["Economics"],
        education: json["Education"],
        federal: json["Federal"],
        femaleNonPhD: json["Female Non-PhD"],
        femalePhD: json["Female PhD"],
        financialAid: json["Financial Aid"],
        foodScience: json["Food Science"],
        grandTotal: json["Grand Total"],
        hec: json["HEC"],
        housing: json["Housing"],
        institutionalAccreditation: json["Institutional Accreditation"],
        islamabad: json["Islamabad"],
        islamicStudies: json["Islamic Studies"],
        kpk: json["KPK"],
        karachi: json["Karachi"],
        lahore: json["Lahore"],
        law: json["Law"],
        location: json["Location"],
        maleNonPhD: json["Male Non-PhD"],
        malePhD: json["Male PhD"],
        maleToFemaleRatio: json["Male to Female ratio"].toDouble(),
        massCommunication: json["Mass Communication"],
        mathematics: json["Mathematics"],
        microbiology: json["Microbiology"],
        pec: json["PEC"],
        pmdc: json["PMDC"],
        peshawar: json["Peshawar"],
        pharmaceutics: json["Pharmaceutics"],
        pharmacology: json["Pharmacology"],
        philosophy: json["Philosophy"],
        physiology: json["Physiology"],
        politicalScience: json["Political Science"],
        postgraduateFees: json["Postgraduate fees"],
        private: json["Private"],
        province: json["Province"],
        psychology: json["Psychology"],
        public: json["Public"],
        punjab: json["Punjab"],
        sindh: json["Sindh"],
        sociology: json["Sociology"],
        specialEducation: json["Special Education"],
        studentToFacultyRatio: json["Student to Faculty Ratio"],
        studentsEnrolled: json["Students Enrolled"],
        undergraduateFees: json["Undergraduate fees"],
        university: json["University"],
        unnamed0: json["Unnamed: 0"],
        visualStudies: json["Visual Studies"],
        years: json["Years"],
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "Academic Staff": academicStaff,
        "Applied Chemistry": appliedChemistry,
        "Applied Physics": appliedPhysics,
        "Balochistan": balochistan,
        "Biochemistry": biochemistry,
        "Botany": botany,
        "Business": business,
        "Campuses": campuses,
        "Commerce": commerce,
        "Criminology": criminology,
        "Distance km (From Central)": distanceKmFromCentral,
        "Economics": economics,
        "Education": education,
        "Federal": federal,
        "Female Non-PhD": femaleNonPhD,
        "Female PhD": femalePhD,
        "Financial Aid": financialAid,
        "Food Science": foodScience,
        "Grand Total": grandTotal,
        "HEC": hec,
        "Housing": housing,
        "Institutional Accreditation": institutionalAccreditation,
        "Islamabad": islamabad,
        "Islamic Studies": islamicStudies,
        "KPK": kpk,
        "Karachi": karachi,
        "Lahore": lahore,
        "Law": law,
        "Location": location,
        "Male Non-PhD": maleNonPhD,
        "Male PhD": malePhD,
        "Male to Female ratio": maleToFemaleRatio,
        "Mass Communication": massCommunication,
        "Mathematics": mathematics,
        "Microbiology": microbiology,
        "PEC": pec,
        "PMDC": pmdc,
        "Peshawar": peshawar,
        "Pharmaceutics": pharmaceutics,
        "Pharmacology": pharmacology,
        "Philosophy": philosophy,
        "Physiology": physiology,
        "Political Science": politicalScience,
        "Postgraduate fees": postgraduateFees,
        "Private": private,
        "Province": province,
        "Psychology": psychology,
        "Public": public,
        "Punjab": punjab,
        "Sindh": sindh,
        "Sociology": sociology,
        "Special Education": specialEducation,
        "Student to Faculty Ratio": studentToFacultyRatio,
        "Students Enrolled": studentsEnrolled,
        "Undergraduate fees": undergraduateFees,
        "University": university,
        "Unnamed: 0": unnamed0,
        "Visual Studies": visualStudies,
        "Years": years,
        "index": index,
      };
}
