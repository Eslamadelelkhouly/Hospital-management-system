class BackendEndpoint {
  static const endpointregiseter =
      'http://10.0.2.2:8000/api/patient-group/patient/register';
  static const endpointlogin =
      'http://10.0.2.2:8000/api/patient-group/patient/login';
  static const endpointShowDoctor =
      'http://10.0.2.2:8000/api/doctors-group/doctors';
  static const getavailbletimedoctor =
      'http://10.0.2.2:8000/api/appointments/doctors/available/';
  static const getdoctorwithid =
      'http://10.0.2.2:8000/api/doctors-group/doctors/view/';

  static const bookappointment = 'http://10.0.2.2:8000/api/appointments/book';
  static const getpatientinfo =
      'http://10.0.2.2:8000/api/patient-group/patient/me';

  static const gettopdoctor =
      'http://10.0.2.2:8000/api/doctors-group/top-doctors/';

  static const addfavourite =
      'http://10.0.2.2:8000/api/patient-group/favorite/toggle';
  static const getfavourite =
      'http://10.0.2.2:8000/api/patient-group/favorite/doctors';

  static const getlabtest =
      'http://10.0.2.2:8000/api/medical-test/medical-tests';

  static const getmedicalinfo =
      'http://10.0.2.2:8000/api/medical-test/medical-test/view/';

  static const getmedicaltestavailable =
      'http://10.0.2.2:8000/api/medical-test-appointments/tests/available/';
  static const bookmedicaltest =
      'http://10.0.2.2:8000/api/medical-test-appointments/appoint';
  static const getupcomingappointment =
      'http://10.0.2.2:8000/api/appointments/upcoming';

  static const deleteAppointment =
      'http://10.0.2.2:8000/api/appointments/cancel/';

  static const getcancelappointment =
      'http://10.0.2.2:8000/api/appointments/canceled';

  static const getdoctorbyName =
      'http://10.0.2.2:8000/api/search/doctors/search?query=';

  static const getUpcomingMedicalTest =
      'http://10.0.2.2:8000/api/medical-test-appointments/upcoming';
  static const deletemdicaltest =
      'http://10.0.2.2:8000/api/medical-test-appointments/cancel/';

  static const getcancelmedicaltest =
      'http://10.0.2.2:8000/api/medical-test-appointments/canceled';
  static const getmedicaltestsearch =
      'http://10.0.2.2:8000/api/search/medical-tests/search?query=';
  static const logout = 'http://10.0.2.2:8000/api/patient-group/patient/logout';
  static const foretpassword =
      "http://10.0.2.2:8000/api/reset-password/send-code";

  static const verify = "http://10.0.2.2:8000/api/reset-password//reset";

  static const editprofile = 'http://10.0.2.2:8000/api/patient-group/patient/update/';
}
