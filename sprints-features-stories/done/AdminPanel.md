As an admin I should be able to login with OTP via my phone
As an admin I should be able to logout

Implementation details:
An admin will be preconfigured in database to have email and phone_number.

To login, the admin will go to the /admin/login route where they will get a login screen, and then verify OTP.
Upon logging in they will be redirected to admin screens
