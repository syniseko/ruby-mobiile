# **tokopedia-test**

before run, makesure you have ruby version >= ruby 2.7.2

Preconditions Setting Project 
- go to directory rood project, and run : (for get dependence project)
    `bundle init`
    `sudo bundle install`


notes :
- setting configuration on file `features/support/env.rb`
    `ENV['BROWSER_TYPE'] = 'firefox'`
    `ENV['OS'] = 'mac'`
    `ENV['URL'] = 'https://www.saucedemo.com/'`
    `ENV['DELAY_STEP'] = '1'`
- makesure you have latest update browser on mac


How To Run :
- go to directory project 
- open terminal or cmd
    `cucumber -t @e2e_buy_product`



design patterns Project :
1. Project using ruby script 
2. Project using BDD cucumber Framework
3. run via cucumber task 
4. Report using cucumber report
5. Detail Patterns :
    - Asset
        detail for driver configuration and screenshot resulth
    - feature/cores
        detail for core of project, step to selenium lib, ex user_click()
    - feature/step
        detail for main step or cucumber syntax, logic mapping to testdata,translation and element 
    - suport/env
        detail for preconditions running and configuration capabilities of project
    - support/local_driver
        detail for instance env mapping configuration
    - support/hooks
        declaration for precondition befor test/after test or countinues testcase handling (on this project not using hooks)
    - feature/test.feature
        detail for gherkins format support for testcase using BDD steps
    - resources/element/etc
        detail for mapping modular element mapping
    - resources/test_data
        detail for login data configuration, using key format on yml file
    - resources/translation
        detail for translation data format, doing for verify data translation on page harcode on we have data expect
    - And Other file is generate by cucumber and ruby ruby structure
    