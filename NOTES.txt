Noted a notes app

MODELS
  user
    has many post
  notes
    belongs to user

CONTROLLERS
  user
  post
  feed

VIEWS
  user
    sees their notes
  post
    seen by user

  *feed
    users can see all their notes


Note

id | user_id | content

User

id | username | password |

USER STORY

1.user can registers on index page
2.user can sign in
3.can create new notes or see old notes
4.when viewing old notes user can delete note.
5.Edit old notes
6.user can log out
