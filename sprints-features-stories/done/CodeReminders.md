# Code Reminders

Users register email and cadence. Based on cadence we send out programming questions and random langs.

## User Flow

### As a user I can signup for code reminders
- Get to Create Code Reminder Page.
- Create code reminder.
- Get confirmation email.

### As a user I can recieve code reminders
- When the users cadence hits the timestamp send them an email with the question.

### As a user I can delete or edit my code reminders
- Whenever a code reminder email is sent out, also attach secure links to edit code reminder page, and to delete code_reminder page.
- When a user clicks on edit or delete links show page with their code_reminders only, and let them edit it. Only the user who opens the email can use the said page.


## Implementation
- Keep code reminder signup page public.
- Questions are randomly chosen from AOC and Project euler, along with a major language picked from a const array.
- With each email we send out when the cadence hits, create a token attached to the link. This link token contains the users email and is used to render a home page where the user sees their code_reminder only. To edit or delete this code_reminder the token is persisted and required.
- Schedule an email sending job in sidekiq, whenever the email sending job is completed schedule a new job that conforms to the cadence.

