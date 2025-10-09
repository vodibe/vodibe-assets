## Guide 1

I mean it's a mouse, it needs to work any time I want to use it. No hassle with backups and restores when you open your laptop en-route on a flight or somewhere at a customer. This is just wierd Logitech. Solve it.

I blocked:  
updates.logitech.com  
updates.optionsplus.logitechg.com  
cpgbackup.logitech.com

and from the logioptionsplus_agent.exe blocked all in-out in the firewall as well. Does seem to do the trick. No wierd traffic and the app doesn't seem to update anomore, which is what I want.

Edit 2:  
To keep all other functions (such as Flow) working properly, it's sufficient to only point [updates.logitech.com](http://updates.logitech.com) and [updates.optionsplus.logitechg.com](http://updates.optionsplus.logitechg.com) to [127.0.0.1](http://127.0.0.1) in the hosts file. Logi Options+ doesn't throw an error, but simply says you're up-to-date :-)  
Just add:

127.0.0.1 updates.logitech.com  
127.0.0.1 updates.optionsplus.logitechg.com

to the c:\\windows\\system32\\drivers\\etc\\hosts and you're good to go.

## Guide 2

-   Get yourself the Offline Installer version of Options+ ( I'm on 1.90.714605 )
-   Setup your Devices with everything you need.
-   Backup the settings.db found in C:\Users\YOURUSER\AppData\Local\LogiOptionsPlus
