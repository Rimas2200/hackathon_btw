from django.shortcuts import render

from main.models import EducationalInstitution, Employer, Resume, Student, User, Vacancy

def index(request):
    user = User.objects.all()
    
    context = {
        'users': user,
    }
    return render(request, 'main/index.html', context)