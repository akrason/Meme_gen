# projekt-zaliczeniowy-ak-kk
projekt-zaliczeniowy-ak-kk created by GitHub Classroom

| Kierunek              | Przedmiot           | Semestr | Rok akademicki |
| :-------------------: | :-----------------: | :-----: | :------------: |
| Informatyka Stosowana | Inżynieria Internetu| 5       | 2020/2021      |

Projekt generatora memów.
Java 15+SpringBoot+Maven

Baza danych:
- składa się z trzech tabel :
  -User
  -Image
  -Category

User:

    -user_id
    -username
    -password(BCrypt encoder)
    -email

Image:

    -meme_id
    -tag
    -address
    -name
    -category_id (FK)
  
Category:

    -category_id
    -name
 
Funkcjonalności:

GET :

    /api/users - wyświetla listę użytkowników 
    /api/images - wyświetla wszystkie obrazy z bazy
    /api/categories - wyświetla listę kategorii
    /api/users/{id} - wyświetla danego użytkownika
    /api/categories/{id} - wyświetla daną kategorię
    /api/images/{id} - wyświetla obraz podanym identyfikatorem
    /api/images/random - wyświetla losowy obraz
    /api/images/category{id} - wyświetla listę obrazów z danej kategorii
    
POST :

    /api/users/  - dodaje użytkownika - dla admina
    /api/users/registration  - rejestruje nowego użytkownika
    /api/images/ - dodaje nowy obraz
    /api/categories/ - dodaje nową kategorię
    /authenticate - tworzy token JWT dla zarejestrowanego i zalogowanego użytkowika
    
PUT:

    /api/users/{id}  - aktualizuje dane użytkownika o danym id
    /api/images/{id}  - umożliwia zmianę tagu i kategorii danego obrazu
    /api/categories/{id} - zmiana nazwy kategorii
    
DELETE:

    /api/users/{id} - usuwa danego użytkownika
    /api/images/{id} - usuwa dany obraz
    /api/categories/{id} - usuwa daną kategorię
    
Niezalogowany użytkownik ma dostęp do metod GET, oprócz /api/users , oraz do metod POST : /authenticate  i /api/users/registration
Zalogowany użytkownik może dodawać i aktualizować kategorie, obrazy i swoje dane.
Admin ma dostęp do reszty funkcji

Przykłady Request Body:
new User:

    {
      "username":"nazwaa",
      "password":"Odpowiedniehasło1@",
      "email":"jakis@email.com"
    }
    
new Image:
    
    {
      "tag": "praca",
      "address": "https://cdn-images.interviewme.pl/pages/memy_praca_biurowa.jpg",
      "name": "1 dzień wolnego",
      "category": {
          "name": "job",
          "id": 8
      },
      "id": 17
    }

new Category:

    {
        "name": "other",
        "id": 1
    }
    
new UserDTO :
    
    {
        "username":"nazwa",
        "email":"email@email.com",
        "password":"Przyklad12@",
        "matchingPassword":"Przyklad12@"
    }
    



