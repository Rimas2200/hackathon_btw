## Создать/обновить вакансию.

### Права доступа
- Аутентифицированный пользователь.
- Пользователь является работодателем.

### Формат запроса:
**HTTP-метод:** POST   
**URL:** ```/api/employer/<employer_id:int>/vacancy```  

**Параметры запроса:**
- employer_id — id работодателя.

### Формат ответа:

**HTTP-статус ответа:** 200   
**Состояние:** Запрос завершен успешно.  
**Тело запроса:**
```
{
  "vacancy_id": int|null,   # Если null, создается новая вакансия, иначе обновляется существующая
  "title": str,             # Название вакансии (обязательно)
  "company_name": str,      # Название компании (обязательно)
  "description": str,       # Описание вакансии (обязательно)
  "responsibilities": str,  # Обязанности на позиции (обязательно)
  "requirements": str,      # Требования к соискателю (обязательно)
  "conditions": {           # Условия вакансии
      "positions_available": int,  # Количество доступных мест (обязательно)
      "salary": str|null,          # Зарплата (опционально)
      "address": str               # Адрес работы (обязательно)
  }
}

```
- vacancy_id — ID вакансии.
- title — Название вакансии.
- company_name — Название компании.
- description — Описание вакансии.
- responsibilities — Обязанности на позиции.
- requirements — Требования к соискателю.
- conditions — Условия:
  - positions_available — Количество доступных мест.
  - salary — Зарплата, если указана.
  - address — Адрес работы.

**Пример ответа:**
```
{
  "vacancy_id": 10,
  "title": "Программист",
  "company_name": "ООО Компания",
  "description": "Разработка и поддержка ПО.",
  "responsibilities": "Поддержка текущих решений и участие в новых проектах.",
  "requirements": "Опыт работы с Python и Django.",
  "conditions": {
      "positions_available": 3,
      "salary": "120000",
      "address": "Екатеринбург, ул. Ленина, 10"
  }
}

```

**HTTP-статус ответа:** 400    
**Состояние:** Ошибка валидации. Тело запроса не соответствует спецификации.  
**Пример ответа:**
```
{
  "error": "Некорректные данные запроса.",
  "details": {
      "title": "Это поле обязательно.",
      "company_name": "Это поле обязательно.",
      "description": "Это поле обязательно.",
      "responsibilities": "Это поле обязательно.",
      "requirements": "Это поле обязательно.",
      "conditions.positions_available": "Это поле обязательно.",
      "conditions.address": "Это поле обязательно."
  }
}
```
