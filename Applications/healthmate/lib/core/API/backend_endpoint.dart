class BackendEndpoint {
  static const endpointregiseter =
      'http://10.0.2.2:8000/api/patient-group/patient/register';
  static const endpointlogin =
      'http://10.0.2.2:8000/api/patient-group/patient/login';
  static const endpointShowDoctor =
      'http://10.0.2.2:8000/api/doctors-group/doctors';
  static const getavailbletimedoctor =
      'http://10.0.2.2:8000/api/appointments/doctors/available/';

  static const bookappointment = 'http://10.0.2.2:8000/api/appointments/book';
  static const getpatientinfo =
      'http://10.0.2.2:8000/api/patient-group/patient/me';

  static const gettopdoctor =
      'http://10.0.2.2:8000/api/doctors-group/top-doctors/';

  static const addfavourite =
      'http://10.0.2.2:8000/api/patient-group/favorite/toggle';
}
