# SJML’s chemistry scripts 

These are a series of scripts to install specific chemical analysis software on your Mac. Please note that I am in no way involved with making the software and cannot support problems with using it. I am not even a chemist, so probably won’t understand the question. 

But if you have trouble with installation from any of these scripts, open an issue or something. 

You can run these scripts automatically by opening the Terminal app (in `/Applications/Utilities`) and pasting the lines from the various sections below. Or, if you don’t like piping the internet directly into your shell, you can download this repository and run them directly. 

## Installing SHELX

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sjml/chemistry/master/install/shelx.sh)"
```

## Installing Platon

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sjml/chemistry/master/install/platon.sh)"
```

Note that it will ask for your password, so stick around. It may look like it’s frozen at a few points, but that’s just because installing Xquartz and compiling stuff takes a bit of time. After it’s done, open up an Xquartz terminal and run this command to test it:

```bash
platon ~/Desktop/platon/sucrose.spf
```

Once you’ve confirmed that works, you can delete the "platon" folder on your desktop, unless you think you might want the sample `sucrose.spf` file. 

### Olex²
If you need platon to work with Olex², select the Home panel and then click on Settings. In that list, there should be an entry for Path. Enter `/usr/local/bin/`, click out of the settings box, and restart Olex². 

### Updating Platon
To update to the latest version, run the following line in the terminal: 

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sjml/chemistry/master/update/platon.sh)"
```
