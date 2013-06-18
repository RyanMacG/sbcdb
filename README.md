##Subcontractor Database

A web application to handle the input of subcontractor questionnaires. I know this is an edge case situation but if you can make it work for your situation feel free to submit pull requests and patches.


Distributed under the MIT license.

Uses [blueprint.css](http://www.blueprintcss.org/) for print.css
Uses [bootstrap](http://twitter.github.io/bootstrap/) for UI
___

###Setup

SBCDB is set up to use environment variables for anything specific to your settings to make these work. There is an example defaults file and it is deployed as part of the capistrano setup stage.

    ENV["comp_logo"] = "comp_logo" #whatever you want the logo to display as in the header
    ENV["comp_title"] = "title" #whatever title you want to be displayed before the pipe character

With these set it should work for any internal usage you might have for subcontractors.

___

Commit/Merge Messages use the following convention;

- **Message** (_Requester_)

All tasks that are currently needing done can be viewed in the [TODO](TODO.md) file  

A full [changelog](changelog.md) (from v1.3 onwards) is available.
