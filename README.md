# vagrant-bcctools

I created this repo because it turns out that playing with [bcctools](https://github.com/iovisor/bcc) on macOS is a PITA.

You can't use the following:

* the docker image mentioned in the bcc repo's [`QUICKSTART.md`](https://github.com/iovisor/bcc/blob/master/QUICKSTART.md) because that's expected a Linux Docker host.
* the [vagrant](https://github.com/iovisor/vagrant) repo is 4 years old and doesn't appear to play nice with a modern version of Vagrant.

## usage

* We'll assume you've installed VirtualBox and Vagrant.

Setup the vagrant session (this will take a while).

```sh
make setup
```

Once vagrant session is up, you can verify your install using the "hello world" python script:

```sh
vagrant ssh
sudo /usr/share/doc/bpfcc-tools/examples/hello_world.py
```

In another terminal session

```sh
vagrant ssh
```

In the first terminal session you'll see something similar as the ssh session begins and [`clone`](https://linux.die.net/man/2/clone) syscall is triggered.

```sh
            bash-5259  [000] ....  1069.839261: 0x00000001: Hello, World!
 systemd-journal-404   [000] ....  1204.523418: 0x00000001: Hello, World!
 systemd-journal-404   [000] ....  1204.524228: 0x00000001: Hello, World!
            cron-600   [000] ....  1341.196720: 0x00000001: Hello, World!
   systemd-udevd-424   [000] ....  1341.197997: 0x00000001: Hello, World!
   systemd-udevd-424   [000] ....  1341.200345: 0x00000001: Hello, World!
   systemd-udevd-424   [000] ....  1341.201614: 0x00000001: Hello, World!
            cron-5301  [000] ....  1341.204409: 0x00000001: Hello, World!
   systemd-udevd-424   [000] ....  1341.205735: 0x00000001: Hello, World!
              sh-5304  [000] ....  1341.206716: 0x00000001: Hello, World!
   systemd-udevd-424   [000] ....  1341.207485: 0x00000001: Hello, World!
 systemd-journal-404   [000] ....  1641.273555: 0x00000001: Hello, World!
```

to tear down

```sh
make clean
```

### Running BCC tools
The tools are installed in `/sbin` (`/usr/sbin` in Ubuntu 18.04) with a -bpfcc extension. More information can be found in the [BCC install docs](https://github.com/iovisor/bcc/blob/master/INSTALL.md#ubuntu---binary).

After `vagrant ssh`, you can run any tool such as `execsnoop` by calling it directly or from the `/usr/sbin` directory. e.g.

```sh
sudo execsnoop-bpfcc

sudo /usr/sbin/execsnoop-bpfcc
```

## copyright

2019 &copy; Mark Sta Ana
