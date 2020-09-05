# Do SMS

A Simple utility flutter application to send messages to a number based on HTTP Requests.

## Getting Started

Install the flutter app.
Connect to the network where the client can send HTTP Request to the app.
Click GetIP button to see IP of Mobile on that Network.
Send Request as-

http://ip_address:4444/?num=the_number_where_you_want_to_send_sms&body=the_body_you_want_to_send

**Num must be prefixed with country code without +**
eg. 919999999999

**body should be less than 1000 chars.**
Due to Path Limitations.
