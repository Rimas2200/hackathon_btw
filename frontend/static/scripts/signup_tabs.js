student_btn = document.getElementById("btn-student");
employer_btn = document.getElementById("btn-employer");
institution_btn = document.getElementById("btn-institution");

student_tab = document.getElementById("tab-student");
employer_tab = document.getElementById("tab-employer");
institution_tab = document.getElementById("tab-institution");


student_btn.addEventListener("click", () => {
    if(student_tab.classList.contains('tab-passive')) {
        employer_tab.classList.replace('tab-active', 'tab-passive');
        institution_tab.classList.replace('tab-active', 'tab-passive');

        student_tab.classList.replace('tab-passive', 'tab-active');

        if(!company_field.classList.contains('hidden')) {
            company_field.classList.add('hidden');
        }

        if(fcs_field.classList.contains('hidden')) {
            fcs_field.classList.remove('hidden');
        }
        if(institution_field.classList.contains('hidden')) {
            institution_field.classList.remove('hidden');
        }
    }
});
employer_btn.addEventListener("click", () => {
    if(employer_tab.classList.contains('tab-passive')) {
        student_tab.classList.replace('tab-active', 'tab-passive');
        institution_tab.classList.replace('tab-active', 'tab-passive');

        employer_tab.classList.replace('tab-passive', 'tab-active');

        if(!fcs_field.classList.contains('hidden')) {
            fcs_field.classList.add('hidden');
        }
        if(!institution_field.classList.contains('hidden')) {
            institution_field.classList.add('hidden');
        }

        if(company_field.classList.contains('hidden')) {
            company_field.classList.remove('hidden');
        }
    }
});
institution_btn.addEventListener("click", () => {
    if(institution_tab.classList.contains('tab-passive')) {
        student_tab.classList.replace('tab-active', 'tab-passive');
        employer_tab.classList.replace('tab-active', 'tab-passive');

        institution_tab.classList.replace('tab-passive', 'tab-active');

        if(!fcs_field.classList.contains('hidden')) {
            fcs_field.classList.add('hidden');
        }
        if(!company_field.classList.contains('hidden')) {
            company_field.classList.add('hidden');
        }

        if(institution_field.classList.contains('hidden')) {
            institution_field.classList.remove('hidden');
        }
    }
});