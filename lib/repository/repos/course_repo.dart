import 'package:edurald/repository/models/course/course.dart';
import 'package:edurald/repository/services/course_services.dart';

class CourseRepository {
  const CourseRepository({
    required this.service,
  });
  final CourseService service;

  // Future<Career> getCareers() async => service.getCareers();

  Future<List<Course>?> getCourses() async => service.getCourses();

  Future<List<Course>?> getCoursesByCareer() async =>
      service.getCoursesByCareer();
}
