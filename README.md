What?
=====

A plugin for Oldskool displays IP information from ipinfodb.com

Configuration?
--------------

You should sign up for an account at ipinfodb.com, once you have an
API key fill it into your config

In your _oldskool.yaml_ add the following:

    - :ipinfodb_apikey: YOUR_API_KEY

You can then create a keyword:

    :keywords:
    - :type: :ipinfodb
      :keywords:
      - ip

This creates a keyword _ip_ that you can call without any parameters
to get info for your browser IP, otherwise supply an IP as an argument.

Only IPv4 is supported at the moment

Contact?
--------

R.I.Pienaar / rip@devco.net / @ripienaar / http://devco.net/
