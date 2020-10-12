import 'package:qaphelaMobile/model/perpetrator.dart';
import 'package:qaphelaMobile/model/reporter.dart';

class CheckCase {
  int id;
  Reporter reporter;
  Perpetrators perpetrators;
  String title;
  String reportType;
  String occasion;
  String preview;
  String when;
  int frequency;
  String dateReported;
  String caseStatus;
  String settlementType;
  String policeCaseNumber;

  CheckCase(
      {this.id,
      this.reporter,
      this.perpetrators,
      this.title,
      this.reportType,
      this.occasion,
      this.preview,
      this.when,
      this.frequency,
      this.dateReported,
      this.caseStatus,
      this.settlementType,
      this.policeCaseNumber});

  CheckCase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reporter = json['reporter'] != null
        ? new Reporter.fromJson(json['reporter'])
        : null;
    perpetrators = json['perpetrators'] != null
        ? new Perpetrators.fromJson(json['perpetrators'])
        : null;
    title = json['title'];
    reportType = json['report_type'];
    occasion = json['occasion'];
    preview = json['preview'];
    when = json['when'];
    frequency = json['frequency'];
    dateReported = json['date_reported'];
    caseStatus = json['case_status'];
    settlementType = json['settlement_type'];
    policeCaseNumber = json['police_case_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.reporter != null) {
      data['reporter'] = this.reporter.toJson();
    }
    if (this.perpetrators != null) {
      data['perpetrators'] = this.perpetrators.toJson();
    }
    data['title'] = this.title;
    data['report_type'] = this.reportType;
    data['occasion'] = this.occasion;
    data['preview'] = this.preview;
    data['when'] = this.when;
    data['frequency'] = this.frequency;
    data['date_reported'] = this.dateReported;
    data['case_status'] = this.caseStatus;
    data['settlement_type'] = this.settlementType;
    data['police_case_number'] = this.policeCaseNumber;
    return data;
  }
}










