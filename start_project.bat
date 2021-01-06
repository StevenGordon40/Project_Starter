@ECHO off

IF "%1" == "" GOTO NOINPUT ELSE GOTO INPUT

:INPUT
cd C:\Users\Steve\OneDrive\Desktop\project_starter_testing
set title=%1
set GITUSERNAME=%2
mkdir %title%
cd %title%
GOTO NPMINIT

:NOINPUT
cd C:\Users\Steve\OneDrive\Desktop\project_starter_testing
set /p title=Name your project: 
mkdir %title%
cd %title%
set /p GITUSERNAME=What is your Git Hub Username:
GOTO NPMINIT

:NPMINIT
set file=package.json
>%file%  echo {
>>%file% echo   "name": "%title%",
>>%file% echo   "version": "1.0.0",
>>%file% echo   "description": "",
>>%file% echo   "main": "index.js",
>>%file% echo   "scripts": {
>>%file% echo     "test": "mocha"
>>%file% echo   },
>>%file% echo "repository": {
>>%file% echo     "type": "git",
>>%file% echo     "url": "git+https://github.com/%GITUSERNAME%/%title%.git"
>>%file% echo   },
>>%file% echo   "keywords": [],
>>%file% echo   "author": "Steven Gordon",
>>%file% echo   "license": "ISC"
>>%file% echo }
GOTO HELLO

:HELLO
mkdir test
cd test
set file=hello_test.js
>%file%  echo const expect = require('chai').expect
>>%file% echo // Hello world to check test framework is working
>>%file% echo describe('Mocha Hello World!', () =^>{
>>%file% echo   //Test
>>%file% echo   it('Should run our tests using npm',() =^> {
>>%file% echo     expect(true).to.be.ok
>>%file% echo   })
>>%file% echo })
cd..
GOTO GITINIT

:GITINIT
git init
set file=.gitignore
>%file%  echo node_modules
GOTO :MODINSTALL

:MODINSTALL
npm install -D mocha chai
GOTO END

:END
exit
