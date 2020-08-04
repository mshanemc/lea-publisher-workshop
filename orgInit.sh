sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx force:source:push
# install mobile publisher managed packages https://help.salesforce.com/articleView?id=branded_apps_playground_getstarted.htm&type=5
sfdx force:package:install --package 04t1I000003RkFQQA0 --publishwait 60 --wait 60
sfdx force:package:install --package 04t1I000003RkFaQAK --publishwait 60 --wait 60

sfdx force:org:open