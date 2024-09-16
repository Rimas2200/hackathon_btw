from django.contrib import admin

from main.models import EducationalInstitution, Employer, Resume, Student, User, Vacancy

admin.site.register(EducationalInstitution)
admin.site.register(Employer)
admin.site.register(Resume)
admin.site.register(Student)
admin.site.register(User)
admin.site.register(Vacancy)