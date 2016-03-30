cygwin-configuration Cookbook
==================

This cookbook implements Cygwin configuration and performs the following:

- Deletes windows temp folders content.
- Configures Cygwin

#### Supported OS's
==================
- Windows 7
- Windows 8
- Windows 8.1
- Windows 10
- Windows Server 2008 R2
- Windows Server 2012 R2

Attributes
==================

| Key | Type | Description | Default |
| --- | ---- | ----------- | ------- |
|['cygwin-configuration']['original_files'] | Array | Files to rename | ['link.exe', 'dir.exe'] |
|['cygwin-configuration']['new_extention']| String | Extention | .origin |

Usage
-----
#### cygwin-configuration::default

Will run clear_temp_folder 

#### cygwin-configuration::clear_temp_folder
--------------------------------------
 
#### cygwin-configuration::cygwin_configuration
--------------------------------------
 
Configures Cygwin.

If you wish to rename some files to the new extention:

	{
	  "cygwin-configuration": {
		"original_files": "['link.exe', 'dir.exe']",
	    "new_extention": ".origin"
	  }
	}