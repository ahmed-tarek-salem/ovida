class DropdownMenusModel {
  final bool success;
  final Data data;

  DropdownMenusModel({
    required this.success,
    required this.data,
  });

  factory DropdownMenusModel.fromJson(Map<String, dynamic> json) =>
      DropdownMenusModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  final Map<String, List<ChronicDisease>> chronicDiseases;
  final EnvironmentalAllergies environmentalAllergies;
  final List<String> familyMedicalConditions;
  final FoodAllergies foodAllergies;
  final MedicationAllergies medicationAllergies;
  final List<String> previousSurgeries;
  final List<String> medicalSpecialties;
  final List<TreatmentPlanOption> treatmentPlanOptions;
  final MedicalTestsCatalog medicalTestsCatalog;

  Data({
    required this.chronicDiseases,
    required this.environmentalAllergies,
    required this.familyMedicalConditions,
    required this.foodAllergies,
    required this.medicationAllergies,
    required this.previousSurgeries,
    required this.medicalSpecialties,
    required this.treatmentPlanOptions,
    required this.medicalTestsCatalog,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        chronicDiseases: Map.from(json["chronicDiseases"]).map((k, v) =>
            MapEntry<String, List<ChronicDisease>>(
                k,
                List<ChronicDisease>.from(
                    v.map((x) => ChronicDisease.fromJson(x))))),
        environmentalAllergies:
            EnvironmentalAllergies.fromJson(json["environmentalAllergies"]),
        familyMedicalConditions:
            List<String>.from(json["familyMedicalConditions"].map((x) => x)),
        foodAllergies: FoodAllergies.fromJson(json["foodAllergies"]),
        medicationAllergies:
            MedicationAllergies.fromJson(json["medicationAllergies"]),
        previousSurgeries:
            List<String>.from(json["previousSurgeries"].map((x) => x)),
        medicalSpecialties:
            List<String>.from(json["medicalSpecialties"].map((x) => x)),
        treatmentPlanOptions: List<TreatmentPlanOption>.from(
            json["treatmentPlanOptions"]
                .map((x) => TreatmentPlanOption.fromJson(x))),
        medicalTestsCatalog:
            MedicalTestsCatalog.fromJson(json["medicalTestsCatalog"]),
      );

  Map<String, dynamic> toJson() => {
        "chronicDiseases": Map.from(chronicDiseases).map((k, v) =>
            MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "environmentalAllergies": environmentalAllergies.toJson(),
        "familyMedicalConditions":
            List<dynamic>.from(familyMedicalConditions.map((x) => x)),
        "foodAllergies": foodAllergies.toJson(),
        "medicationAllergies": medicationAllergies.toJson(),
        "previousSurgeries":
            List<dynamic>.from(previousSurgeries.map((x) => x)),
        "medicalSpecialties":
            List<dynamic>.from(medicalSpecialties.map((x) => x)),
        "treatmentPlanOptions":
            List<dynamic>.from(treatmentPlanOptions.map((x) => x.toJson())),
        "medicalTestsCatalog": medicalTestsCatalog.toJson(),
      };
}

class ChronicDisease {
  final String category;
  final String name;
  final List<String> subcategories;

  ChronicDisease({
    required this.category,
    required this.name,
    required this.subcategories,
  });

  factory ChronicDisease.fromJson(Map<String, dynamic> json) => ChronicDisease(
        category: json["category"],
        name: json["name"],
        subcategories: List<String>.from(json["subcategories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "name": name,
        "subcategories": List<dynamic>.from(subcategories.map((x) => x)),
      };
}

class EnvironmentalAllergies {
  final List<Airborne> airborne;
  final List<Airborne> indoor;
  final List<Airborne> animals;
  final List<Airborne> insects;
  final List<Airborne> materials;

  EnvironmentalAllergies({
    required this.airborne,
    required this.indoor,
    required this.animals,
    required this.insects,
    required this.materials,
  });

  factory EnvironmentalAllergies.fromJson(Map<String, dynamic> json) =>
      EnvironmentalAllergies(
        airborne: List<Airborne>.from(
            json["Airborne"].map((x) => Airborne.fromJson(x))),
        indoor: List<Airborne>.from(
            json["Indoor"].map((x) => Airborne.fromJson(x))),
        animals: List<Airborne>.from(
            json["Animals"].map((x) => Airborne.fromJson(x))),
        insects: List<Airborne>.from(
            json["Insects"].map((x) => Airborne.fromJson(x))),
        materials: List<Airborne>.from(
            json["Materials"].map((x) => Airborne.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Airborne": List<dynamic>.from(airborne.map((x) => x.toJson())),
        "Indoor": List<dynamic>.from(indoor.map((x) => x.toJson())),
        "Animals": List<dynamic>.from(animals.map((x) => x.toJson())),
        "Insects": List<dynamic>.from(insects.map((x) => x.toJson())),
        "Materials": List<dynamic>.from(materials.map((x) => x.toJson())),
      };
}

class Airborne {
  final String category;
  final String name;
  final List<String> examples;

  Airborne({
    required this.category,
    required this.name,
    required this.examples,
  });

  factory Airborne.fromJson(Map<String, dynamic> json) => Airborne(
        category: json["category"],
        name: json["name"],
        examples: List<String>.from(json["examples"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "name": name,
        "examples": List<dynamic>.from(examples.map((x) => x)),
      };
}

class FoodAllergies {
  final List<Airborne> nuts;
  final List<Airborne> seafood;
  final List<Airborne> dairy;
  final List<Airborne> grains;
  final List<Airborne> protein;
  final List<Airborne> legumes;

  FoodAllergies({
    required this.nuts,
    required this.seafood,
    required this.dairy,
    required this.grains,
    required this.protein,
    required this.legumes,
  });

  factory FoodAllergies.fromJson(Map<String, dynamic> json) => FoodAllergies(
        nuts:
            List<Airborne>.from(json["Nuts"].map((x) => Airborne.fromJson(x))),
        seafood: List<Airborne>.from(
            json["Seafood"].map((x) => Airborne.fromJson(x))),
        dairy:
            List<Airborne>.from(json["Dairy"].map((x) => Airborne.fromJson(x))),
        grains: List<Airborne>.from(
            json["Grains"].map((x) => Airborne.fromJson(x))),
        protein: List<Airborne>.from(
            json["Protein"].map((x) => Airborne.fromJson(x))),
        legumes: List<Airborne>.from(
            json["Legumes"].map((x) => Airborne.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Nuts": List<dynamic>.from(nuts.map((x) => x.toJson())),
        "Seafood": List<dynamic>.from(seafood.map((x) => x.toJson())),
        "Dairy": List<dynamic>.from(dairy.map((x) => x.toJson())),
        "Grains": List<dynamic>.from(grains.map((x) => x.toJson())),
        "Protein": List<dynamic>.from(protein.map((x) => x.toJson())),
        "Legumes": List<dynamic>.from(legumes.map((x) => x.toJson())),
      };
}

class MedicalTestsCatalog {
  final BloodTests bloodTests;
  final UrineTests urineTests;
  final MicrobiologyInfectiousDisease microbiologyInfectiousDisease;
  final ImmunologyAutoimmune immunologyAutoimmune;
  final GeneticMolecular geneticMolecular;
  final List<String> cancerMarkers;
  final Miscellaneous miscellaneous;

  MedicalTestsCatalog({
    required this.bloodTests,
    required this.urineTests,
    required this.microbiologyInfectiousDisease,
    required this.immunologyAutoimmune,
    required this.geneticMolecular,
    required this.cancerMarkers,
    required this.miscellaneous,
  });

  factory MedicalTestsCatalog.fromJson(Map<String, dynamic> json) =>
      MedicalTestsCatalog(
        bloodTests: BloodTests.fromJson(json["Blood Tests"]),
        urineTests: UrineTests.fromJson(json["Urine Tests"]),
        microbiologyInfectiousDisease: MicrobiologyInfectiousDisease.fromJson(
            json["Microbiology & Infectious Disease"]),
        immunologyAutoimmune:
            ImmunologyAutoimmune.fromJson(json["Immunology & Autoimmune"]),
        geneticMolecular:
            GeneticMolecular.fromJson(json["Genetic & Molecular"]),
        cancerMarkers: List<String>.from(json["Cancer Markers"].map((x) => x)),
        miscellaneous: Miscellaneous.fromJson(json["Miscellaneous"]),
      );

  Map<String, dynamic> toJson() => {
        "Blood Tests": bloodTests.toJson(),
        "Urine Tests": urineTests.toJson(),
        "Microbiology & Infectious Disease":
            microbiologyInfectiousDisease.toJson(),
        "Immunology & Autoimmune": immunologyAutoimmune.toJson(),
        "Genetic & Molecular": geneticMolecular.toJson(),
        "Cancer Markers": List<dynamic>.from(cancerMarkers.map((x) => x)),
        "Miscellaneous": miscellaneous.toJson(),
      };
}

class BloodTests {
  final List<String> completeBloodCount;
  final List<String> inflammationMarkers;
  final MetabolicPanels metabolicPanels;
  final List<String> liverFunction;
  final List<String> lipidPanel;
  final List<String> endocrine;
  final List<String> coagulation;
  final List<String> ironStudies;
  final List<String> vitamins;
  final List<String> cardiacMarkers;

  BloodTests({
    required this.completeBloodCount,
    required this.inflammationMarkers,
    required this.metabolicPanels,
    required this.liverFunction,
    required this.lipidPanel,
    required this.endocrine,
    required this.coagulation,
    required this.ironStudies,
    required this.vitamins,
    required this.cardiacMarkers,
  });

  factory BloodTests.fromJson(Map<String, dynamic> json) => BloodTests(
        completeBloodCount:
            List<String>.from(json["Complete Blood Count"].map((x) => x)),
        inflammationMarkers:
            List<String>.from(json["Inflammation Markers"].map((x) => x)),
        metabolicPanels: MetabolicPanels.fromJson(json["Metabolic Panels"]),
        liverFunction: List<String>.from(json["Liver Function"].map((x) => x)),
        lipidPanel: List<String>.from(json["Lipid Panel"].map((x) => x)),
        endocrine: List<String>.from(json["Endocrine"].map((x) => x)),
        coagulation: List<String>.from(json["Coagulation"].map((x) => x)),
        ironStudies: List<String>.from(json["Iron Studies"].map((x) => x)),
        vitamins: List<String>.from(json["Vitamins"].map((x) => x)),
        cardiacMarkers:
            List<String>.from(json["Cardiac Markers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Complete Blood Count":
            List<dynamic>.from(completeBloodCount.map((x) => x)),
        "Inflammation Markers":
            List<dynamic>.from(inflammationMarkers.map((x) => x)),
        "Metabolic Panels": metabolicPanels.toJson(),
        "Liver Function": List<dynamic>.from(liverFunction.map((x) => x)),
        "Lipid Panel": List<dynamic>.from(lipidPanel.map((x) => x)),
        "Endocrine": List<dynamic>.from(endocrine.map((x) => x)),
        "Coagulation": List<dynamic>.from(coagulation.map((x) => x)),
        "Iron Studies": List<dynamic>.from(ironStudies.map((x) => x)),
        "Vitamins": List<dynamic>.from(vitamins.map((x) => x)),
        "Cardiac Markers": List<dynamic>.from(cardiacMarkers.map((x) => x)),
      };
}

class MetabolicPanels {
  final List<String> basicMetabolicPanel;
  final List<String> comprehensiveMetabolicPanel;

  MetabolicPanels({
    required this.basicMetabolicPanel,
    required this.comprehensiveMetabolicPanel,
  });

  factory MetabolicPanels.fromJson(Map<String, dynamic> json) =>
      MetabolicPanels(
        basicMetabolicPanel:
            List<String>.from(json["Basic Metabolic Panel"].map((x) => x)),
        comprehensiveMetabolicPanel: List<String>.from(
            json["Comprehensive Metabolic Panel"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Basic Metabolic Panel":
            List<dynamic>.from(basicMetabolicPanel.map((x) => x)),
        "Comprehensive Metabolic Panel":
            List<dynamic>.from(comprehensiveMetabolicPanel.map((x) => x)),
      };
}

class GeneticMolecular {
  final List<String> cytogenetics;
  final List<String> molecularTesting;

  GeneticMolecular({
    required this.cytogenetics,
    required this.molecularTesting,
  });

  factory GeneticMolecular.fromJson(Map<String, dynamic> json) =>
      GeneticMolecular(
        cytogenetics: List<String>.from(json["Cytogenetics"].map((x) => x)),
        molecularTesting:
            List<String>.from(json["Molecular Testing"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Cytogenetics": List<dynamic>.from(cytogenetics.map((x) => x)),
        "Molecular Testing": List<dynamic>.from(molecularTesting.map((x) => x)),
      };
}

class ImmunologyAutoimmune {
  final List<String> autoantibodies;
  final List<String> immuneSystem;
  final List<String> allergy;

  ImmunologyAutoimmune({
    required this.autoantibodies,
    required this.immuneSystem,
    required this.allergy,
  });

  factory ImmunologyAutoimmune.fromJson(Map<String, dynamic> json) =>
      ImmunologyAutoimmune(
        autoantibodies: List<String>.from(json["Autoantibodies"].map((x) => x)),
        immuneSystem: List<String>.from(json["Immune System"].map((x) => x)),
        allergy: List<String>.from(json["Allergy"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Autoantibodies": List<dynamic>.from(autoantibodies.map((x) => x)),
        "Immune System": List<dynamic>.from(immuneSystem.map((x) => x)),
        "Allergy": List<dynamic>.from(allergy.map((x) => x)),
      };
}

class MicrobiologyInfectiousDisease {
  final List<String> cultures;
  final List<String> microscopy;
  final List<String> rapidTests;
  final List<String> hivTests;
  final List<String> hepatitisPanel;
  final List<String> stdTests;
  final List<String> viralStudies;
  final List<String> parasitology;
  final List<String> other;

  MicrobiologyInfectiousDisease({
    required this.cultures,
    required this.microscopy,
    required this.rapidTests,
    required this.hivTests,
    required this.hepatitisPanel,
    required this.stdTests,
    required this.viralStudies,
    required this.parasitology,
    required this.other,
  });

  factory MicrobiologyInfectiousDisease.fromJson(Map<String, dynamic> json) =>
      MicrobiologyInfectiousDisease(
        cultures: List<String>.from(json["Cultures"].map((x) => x)),
        microscopy: List<String>.from(json["Microscopy"].map((x) => x)),
        rapidTests: List<String>.from(json["Rapid Tests"].map((x) => x)),
        hivTests: List<String>.from(json["HIV Tests"].map((x) => x)),
        hepatitisPanel:
            List<String>.from(json["Hepatitis Panel"].map((x) => x)),
        stdTests: List<String>.from(json["STD Tests"].map((x) => x)),
        viralStudies: List<String>.from(json["Viral Studies"].map((x) => x)),
        parasitology: List<String>.from(json["Parasitology"].map((x) => x)),
        other: List<String>.from(json["Other"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Cultures": List<dynamic>.from(cultures.map((x) => x)),
        "Microscopy": List<dynamic>.from(microscopy.map((x) => x)),
        "Rapid Tests": List<dynamic>.from(rapidTests.map((x) => x)),
        "HIV Tests": List<dynamic>.from(hivTests.map((x) => x)),
        "Hepatitis Panel": List<dynamic>.from(hepatitisPanel.map((x) => x)),
        "STD Tests": List<dynamic>.from(stdTests.map((x) => x)),
        "Viral Studies": List<dynamic>.from(viralStudies.map((x) => x)),
        "Parasitology": List<dynamic>.from(parasitology.map((x) => x)),
        "Other": List<dynamic>.from(other.map((x) => x)),
      };
}

class Miscellaneous {
  final List<String> toxicology;
  final List<String> pregnancy;
  final List<String> other;

  Miscellaneous({
    required this.toxicology,
    required this.pregnancy,
    required this.other,
  });

  factory Miscellaneous.fromJson(Map<String, dynamic> json) => Miscellaneous(
        toxicology: List<String>.from(json["Toxicology"].map((x) => x)),
        pregnancy: List<String>.from(json["Pregnancy"].map((x) => x)),
        other: List<String>.from(json["Other"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Toxicology": List<dynamic>.from(toxicology.map((x) => x)),
        "Pregnancy": List<dynamic>.from(pregnancy.map((x) => x)),
        "Other": List<dynamic>.from(other.map((x) => x)),
      };
}

class UrineTests {
  final List<String> basicTests;
  final List<String> the24HourCollections;
  final List<String> other;

  UrineTests({
    required this.basicTests,
    required this.the24HourCollections,
    required this.other,
  });

  factory UrineTests.fromJson(Map<String, dynamic> json) => UrineTests(
        basicTests: List<String>.from(json["Basic Tests"].map((x) => x)),
        the24HourCollections:
            List<String>.from(json["24-Hour Collections"].map((x) => x)),
        other: List<String>.from(json["Other"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Basic Tests": List<dynamic>.from(basicTests.map((x) => x)),
        "24-Hour Collections":
            List<dynamic>.from(the24HourCollections.map((x) => x)),
        "Other": List<dynamic>.from(other.map((x) => x)),
      };
}

class MedicationAllergies {
  final List<Airborne> antibiotics;
  final List<Airborne> nsaiDs;
  final List<Airborne> chemotherapy;

  MedicationAllergies({
    required this.antibiotics,
    required this.nsaiDs,
    required this.chemotherapy,
  });

  factory MedicationAllergies.fromJson(Map<String, dynamic> json) =>
      MedicationAllergies(
        antibiotics: List<Airborne>.from(
            json["Antibiotics"].map((x) => Airborne.fromJson(x))),
        nsaiDs: List<Airborne>.from(
            json["NSAIDs"].map((x) => Airborne.fromJson(x))),
        chemotherapy: List<Airborne>.from(
            json["Chemotherapy"].map((x) => Airborne.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Antibiotics": List<dynamic>.from(antibiotics.map((x) => x.toJson())),
        "NSAIDs": List<dynamic>.from(nsaiDs.map((x) => x.toJson())),
        "Chemotherapy": List<dynamic>.from(chemotherapy.map((x) => x.toJson())),
      };
}

class TreatmentPlanOption {
  final String category;
  final String type;

  TreatmentPlanOption({
    required this.category,
    required this.type,
  });

  factory TreatmentPlanOption.fromJson(Map<String, dynamic> json) =>
      TreatmentPlanOption(
        category: json["category"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": type,
      };
}
