# SJML’s chemistry scripts 

These are a series of scripts to install specific chemical analysis software on your Mac. Please note that I am in no way involved with making the software and cannot support problems with using it. I am not even a chemist, so probably won’t understand the question. I do have a friend who is a chemist though, which is why I host these scripts.

But if you have trouble with installation from any of these scripts, open an issue or something. 

You can run these scripts automatically by opening the Terminal app (in `/Applications/Utilities`) and pasting the lines from the various sections below. Or, if you don’t like piping the internet directly into your shell, you can [download this repository](https://github.com/sjml/chemistry/archive/master.zip) and run them directly. 

## Installing SHELX

Note that before you run this script, you’ll need to have registered yourself at the [SHELX site](http://shelx.uni-goettingen.de/register.php) (this is free for academics). Have the username and password they email you handy because you’ll need to put it in the script. 

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sjml/chemistry/master/install/shelx.sh)"
```

### Olex²
After this script finishes, you can reopen Olex² and should find SHELX routines listed in the Solve and Refine program dropdown menus.

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
