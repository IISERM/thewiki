---
title: "Institute Server Access"
author:
    - Dhruva Sambrani (MS18163)
---
# Institute Server Access

This page runs you through the setup to access the gui for the institute servers using vlc. [Tl;dr](#summary)

# Why should I bother?

A lot of students do not have laptops and are unable to run some programs and analysis required for some courses, especially computational courses, and lab courses. While this doesn't come close to a laptop experience, its a step closer to closing the digital divide between our peers.

Even those who do have a laptop can be benefitted by using this to download the articles and journals that can be accessed for free from the institute networks. 

All you need for this is an android phone which is relatively new (3 yr old).

**We also request people not to use the gui if you are using the compute servers for heavy computation. Please port forward as necessary. GUI puts quite some strain on the server, which mostly is unnecessary, except if one doesn't have a laptop.** 

# Interesting! Let's go

## Setting up your device

1. [Termius - SSH app](https://www.termius.com/android)
2. [VNCViewer - Remote viewing app](https://www.realvnc.com/en/connect/download/viewer/)

## Termius setup

### Add Hosts

1. Create a free account on Termius and set up.
2. Open the Hosts tab.
3. Touch the + button
4. Click `New host`
5. Enter the following info:

    | Name                   | Value                    |
    | ---------------------- | ------------------------ |
    | Alias                  | transit                  |
    | Hostname or IP Address | 14.139.227.194           |
    | SSH                    | Checked                  |
    | Mosh                   | Unchecked                |
    | Username               | transit                  |
    | Password               | Ask personally to people |
    | Rest of the fields     | Empty                    |

6. Click the `tick` on the top right to save.
7. Touch the + button
8. Click `New host`
9. Enter the following info:

    | Name                   | Value                  |
    | ---------------------- | ---------------------- |
    | Alias                  | ldap                   |
    | Hostname or IP Address | 172.16.2.59            |
    | SSH                    | Checked                |
    | Mosh                   | Unchecked              |
    | Username               | `your roll number`     |
    | Password               | `your moodle password` |
    | Rest of the fields     | Empty                  |

10. Tap the `host chaining` field, tap add host, tap `transit`
11. Click the `tick` on the top right to save.

### Add Port Forward rules

1. Choose a number > 5900. This will act as an identifier for your connection. Remember it
2. In termius, open the `port forwarding` tab
3. Touch the + button
4. Enter the following info:

    | Name      | Value             |
    | --------- | ----------------- |
    | Label     | vnc port forward  |
    | Type      | Local Rule        |
    | Host From | transit           |
    | Port From | Your number >5905 |
    | Host to   | localhost         |
    | Port to   | Your number >5905 |

5. Click the `tick` on the top right to save.

**Phew! Are we done yet?**

Nope, but JUST a little more

## Server setup

1. In termius, tap `ldap`
2. If a dialog box opens, click `connect`
3. A terminal will open. You can actually run commands on the institute server now!
4. Copy-Paste the following:
```bash
curl -sL https://iiserm.github.io/server_access/install.sh | bash
```

5. Type `exit` and enter

## VNC Viewer setup

1. Open VNCViewer
2. Touch the + button
3. Fill address as `localhost:your_number`
4. Fill Name as `IISER`
5. Touch create

## DONE!

# Let's Access!

1. Open Termius and go to Hosts tab
2. Touch `ldap`
3. If a dialog box opens, click `connect`
4. Type `source startvnc.sh port_num`, where `port_num` is the number>5905 you chose while creating the port forward.
5. Hit enter
6. Follow the steps
7. Once a lot of output comes up, open VNCViewer
8. Tap `IISER`
9. Enter the password you chose during the Server setup
10. Save the password for future ease
11. DONE!

# Stop access

1. Click on the start button of the server gui, and go to the power tab
2. Click logout, and then logout again. In a few seconds, it will "close unexpectedly", this is ok.
3. In termius, type `exit` and enter
4. Done!

# Summary

1. ssh into ldap via transit
2. Download tigervnc standalone binary from [here](https://bintray.com/tigervnc/stable/tigervnc#files)
3. reverse port forward from `ldap:vncport` to `transit:vncport`
4. Start tigervnc server on `:(vncport-5900)`
5. Port forward `transit:vncport` to `localhost:vncport`
6. Connect using vnc viewer to `localhost:vncport`

See [install script](install.sh) for setup and [server startup script](startvnc.sh) for startup
