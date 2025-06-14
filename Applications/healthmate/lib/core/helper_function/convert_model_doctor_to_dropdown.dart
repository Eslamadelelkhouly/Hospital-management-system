import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart'; // تأكد أنك مستورد الباكدج الصحيح

List<DropDownValueModel> convertDoctorsToDropdown(List<Doctor> doctors) {
  return doctors.map((doctor) {
    return DropDownValueModel(
      name: "${doctor.firstName} ${doctor.lastName}", // الاسم الكامل
      value: doctor.id, // القيمة هي ID الطبيب
    );
  }).toList();
}
