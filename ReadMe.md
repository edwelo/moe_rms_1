# MOE Expenditure Tracking App

This app is a project of the MOE/TCinGC partnership for 2018. The goal of the project is to develop a tool that will improve the efficiency of MOE's existing paper based expenditure tracking process.

Analysis of the process reveals four distinct major steps: Requisitioning, Receiving, Distribution, and Inventory. The app addresses each of the major steps with corresponding modules.

## 2018-07-31

### Need Changes - Presentation.

Presentation width

* The app's width is set at about 1200px to accommodate certain tables that require a lot of space or for situations where sets of info need to be displayed side by side.
* This doesn't work so well for non-tabular info, eg., the Info page. For these types of cases, the presentation is too wide for comfortable reading. Guidelines recommend 80 or less characters per line.
* Maybe implement some means of limiting content to a comfortable if it does not need all the horizontal space?

Login/Logout

* When logged in, looks like "logout Edwel Ongrung"
* When not logged in, looks like "login Not Logged in"
* Make the "Edwel Ongrung" and "Not logged In" much less prominent (smaller?) to clearly differentiate it from the "logout" and "login". The way it is now, it is hard to tell which part to click in order to perform the login/logout.

Modules Menu (Info, Requisitioning, Receiving, ...)

* When highlighted, takes up almost the whole height of the parent div.
* Make the height of the element 'thinner' with equal margins top and bottom.
* The effect should be a vertically centered white box with the margins allowing an equal amount of green to be shown above and below.

## 2018-07-25

### Initial App Training

The data entry functions of Requisitioning and Receiving are working well enough for staff to begin entering data. This was tested at a training/testing session held today with Den, Bonnie, TE, Ole, Adeline, Laurie, Mary, Orchid, Emrei.

Software issues raised:

* Authentication issues. Only laurie was able to log on. Edwel will investigate and fix. Authentication is against LDAP, but those with problems did not seem to be triggering an LDAP response.
* Vendor field needs to be populated with a selector tool.
* Possibly make selector tool for org, acc, etc.
* Some staff went ahead and commented on other unfinished features. We explained that those were still under construction. But the entry functions do work and data entry can begin.
* These should be fixed by Friday so staff can begin entering FY2018 data on Monday.

Most of the discussion actually revolved around the requisitioning process and not on the app itself. Some of the process issues brought to head by the app, and consequently raised by staff include:

* Division of responsibility. Participants were mostly responsible for requisitioning. They wanted to know where their tasks stopped, where Saburo's started, etc. This is a job description problem for these staff. Saburo's JD addresses his part. Without clear JD's, this needs constant negotiation to ensure it works. It is a weak point in the process. Any staff forgets or decides not to use the system reduces the system's usability and there is really no formal way to prevent that.
* Formal numbering of authorization forms. Mentioned options are app issued, manually issued by unit staff (eg., moe001 for moe unit, DSM001 for DSM unit, etc). There is no authorization procedure so right now the app can only have a non-required field for manually inputing an auth number in case people want to do numbering.

## 2018-07-07

The app structure is complete and uploaded to Ameeshi's github today.

The structure consists of the following of the basic working pages,

* requistioning.html
* receiving.html
* distribution.html
* inventory.html

The folder "css" contains the project's css files.

* bootstrap.min.css ... 
* bootstrap.min.css.map ... files that seem to be needed by the above
* req-form.css ... file created by Ameeshi that we are using to format the project pages.

the folder "js" contains the project's javascript files, which are loaded by the pages as appropriate.

* backend_simulator.js ... Simulates the backend. Will be replaced by AJAX calls to the backend.
* frontend_functions_[dist,inv,rcv,rq].js ... These are the page specific javascripts that will provide the front end functionality.
* frontend_main.js ... This probably should be included in the front_end_functions_[].js. No need to have it as a separate file.
* jquery.min.ms ... jquery library. We want to avoid using jquery so this may not be necessary.

**NOTE: Because the javascripts need to be laoded, we need to 'run' these pages on a webserver. If we want to run them locally on the browser, eg., 'file://xxx', we need to manually copy all these javascripts into the script section of the page header.**

### requisitioning.html

* The module that will be used by Bonnie to enter, edit, and print requistions
* The page is working as expected. Provides the basic functionality.
* A placeholder page, requisitioning\_rq\_print.html, will be the rq print form.

### receiving.html

* The module that will be used by Saburo to record received items.
* The page is working as expected. Provides the basic functionality.

### distribution.html

* The module that will be used by Saburo for item distribution
* Just a placeholder now. The module has not been started.

### inventory.html

* The module that will be used by Adeline to track assets.
* Just a placeholder now. The module has not been started.

To be done

* _all. later, after distribution is done._
