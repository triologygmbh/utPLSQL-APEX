# utPLSQL-APEX
APEX Application to Run &amp; Monitor utPLSQL Tests

## Overview
This Application was developed because we had a requirement where we used to write unit tests for legacy code and we used utPLSQL framework. We have developed this Application to save test results and to run multiple tests at once without writing any execution code and also show the results. Since the Application we were working on was an APEX Application, we decided to use APEX as well to run tests and visualize the results.

The Project is completely based on the [utPLSQL Framework](http://utplsql.org/). so you need to install utPLSQL in your database. Currently we have utPLSQL v3.1.8 installed and we are using it with our ATP in Oracle Cloud as well as in some local databases. After importing the APEX Application to your workspace, you need to grant execute priviliges on the utPLSQL test packages to the schema where you have installed the application.

## About the Application
* it can run your test packages (developed with utPLSQL framework) and show results.
* It’s possible to run one or many single tests as well as test packages or all of your tests!
* one can identify the errors and also compare the result with previous output

Tests and results can be accessed by developers as well as from project management side. For example test managers can see the test statistics without accessing any development tool, just using the Browser, without asking for DB USER or connection details! Just give them the link to the Application and their personal user.

## Prerequisites
[utPLSQL Framework](http://utplsql.org/) installed to your database (we are running v3.1.8 but it may be running with later version as well)  
[APEX Environment](https://apex.oracle.com) (Version 19.1 or later) ready to use in your database.

## Installation
### Application
1. Import `f120.sql` to your APEX Workspace.
2. Make sure to install the supporting objects during installation.

### Privileges
Grant execute privileges on your test packages to the user where you have installed the Application to. You can use the script `grant_testcase_schema.sql`. Just replace the variables at the beginning with your user names and run it in the schema containing your tests.

	V_USER_SCHEMA VARCHAR2(30 CHAR) := 'test_case_schema';
	V_UTA_SCHEMA VARCHAR2(30 CHAR)  := 'app_schema';

It will use the utPLSQL API to find your tests.  

## Using the Application
**Note:** Once you have installed the Application and run it for the first time without having any test results, you will get a Javascript Error on the Overview Page. Just process your first test run and the the error will disappear. (We will fix this in the next version :-) )

### Running Tests
Navigate to **Start Testing**. Select the Username which owns the tests (don't forget the grants). You can Click on **Run all tests** now to run all the tests belonging to the selected user.
If you have defined suite pathes in your test packages, you will also be able to choose a particular suite path after selecting the user. And after selecting a suite path you can choose 1 or multiple test packages as well as 1 or multiple single test cases to run. Once you are ready with your selection, click on **Run Selected**.
After clicking on one of the Buttons to run your tests, the selected tests will be processed and you will be automatically redirected to the overview page.

### Browsing the Results
Most functionality is self-explanatory. On the overview page on the top left you can find the statistic of the latest test run. On the top right you find a graphical view of all test runs within the last 7 days. On the bottom left there is an interactive report with statistics for all test runs. You can click into the details here and drill down to the particular test cases and you can also find the history of particular test cases here to compare results of different test runs.
On the bottom right of the overview page you have the ability to search for particular test cases and check whether they have been executed or not. You can also drill down to history and details from this point.
There is another opportunity to display results. Navigate to **Test Report Graphical View**. It might show you some trend of your test results. On the bottom you can drill down to the details again. And you can also delete a whole test run report from your history here.

## Contributions
The utPLSQL APEX App has been developed for a parrticular project and we currently use it in some other cases. We find it very usefule in our cases. Now we share it and like to know if it is useful for other people as well.
**Any feedback or contributions are highly welcome!**
