# vsts-removeWebsiteBinding-task
TFS Utility Task to remove binding from web site on remote server

https://docs.microsoft.com/en-us/azure/devops/extend/develop/integrate-build-task?view=azure-devops

### Install tools

```
npm install -g tfx-cli
```
*restore VSCode to get tfx to work*

# Setup Typescript
```
tsc --init
```

# Build
```
tfx extension create --manifest-globs vss-extension.json
```