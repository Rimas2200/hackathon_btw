# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class EducationalInstitution(models.Model):
    institution_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('User', models.DO_NOTHING)
    institution_name = models.CharField(max_length=255)
    contact_email = models.CharField(max_length=255)
    contact_phone = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'educational_institution'


class Employer(models.Model):
    employer_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('User', models.DO_NOTHING)
    company_name = models.CharField(max_length=255)
    contact_email = models.CharField(max_length=255)
    contact_phone = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'employer'


class Resume(models.Model):
    resume_id = models.AutoField(primary_key=True)
    student = models.ForeignKey('Student', models.DO_NOTHING, to_field='user_id')
    surname = models.ForeignKey('Student', models.DO_NOTHING, db_column='surname', to_field='surname', related_name='resume_surname_set')
    name = models.ForeignKey('Student', models.DO_NOTHING, db_column='name', to_field='name', related_name='resume_name_set')
    patronymic = models.ForeignKey('Student', models.DO_NOTHING, db_column='patronymic', to_field='patronymic', related_name='resume_patronymic_set')
    class_field = models.CharField(db_column='class', max_length=50)  # Field renamed because it was a Python reserved word.
    direction = models.CharField(max_length=255)
    education = models.TextField()
    skills = models.TextField()
    languages = models.TextField()
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'resume'


class Student(models.Model):
    student_id = models.AutoField(primary_key=True)
    user = models.OneToOneField('User', models.DO_NOTHING)
    surname = models.CharField(unique=True, max_length=255)
    name = models.CharField(unique=True, max_length=255)
    patronymic = models.CharField(unique=True, max_length=255)
    email = models.CharField(max_length=255)
    phone = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'student'


class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    login = models.CharField(unique=True, max_length=255)
    password = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    role = models.CharField(max_length=23)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'user'


class Vacancy(models.Model):
    vacancy_id = models.AutoField(primary_key=True)
    employer = models.ForeignKey(Employer, models.DO_NOTHING)
    title = models.CharField(max_length=255)
    description = models.TextField()
    responsibilities = models.TextField()
    requirements = models.TextField()
    positions_available = models.IntegerField()
    salary = models.CharField(max_length=50)
    address = models.CharField(max_length=255)
    employment_type = models.CharField(max_length=50)
    is_active = models.IntegerField()
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'vacancy'
