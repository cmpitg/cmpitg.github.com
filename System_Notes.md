# Nuking Linux servers

From an [InfoWorld][nuking_linux] article.

How to accomplish this? It's fairly simple. The first order of business is to
create a ramdisk and copy all relevant binaries and libraries. Next, stop all
relevant system services that might write to the disks, such as syslog. With
that completed, have a look at the mount table, take note of all block
devices, and dynamically create a script to write zeros (or random, if you so
desire) to every block on those devices at least once -- but preferably five
or more times. Also ensure that you write zeros to the first 512 bytes of each
disk to wipe out the MBR. Once that script has been created and placed on the
ramdisk, turn off all swap, chroot to the ramdisk, and run it from there,
ensuring you'll still have an accessible temporary environment to work with.

The end result of running this script is a completely and totally wiped remote
system, with positive acknowledgement that all partitions were wiped. All of
this is done via ssh with no console or physical access necessary. If you have
hosted Linux servers, or even internal servers at remote sites that need to
disappear for good, this type of system-nuking script will do the job
handily. In fact, when it's time to blow away a Linux server in any location
-- even if it's right next to you -- pulling this script down and running it
as root will do the job quickly and easily.

The one thing this script doesn't do is securely delete any backups or
snapshots the hosting provider might have hanging around. Since that's
extremely provider-specific, you must do some digging on your own, but it
definitely needs to be taken into account when dealing with cloud server
instances or hosted VMs. Zeroing a running server does no good if there are a
half-dozen snapshots waiting in the wings. Also, this won't work with
paravirtualized VPS instances due to the fact that they don't permit low-level
disk access.

[nuking_linux]: http://bit.ly/sReRNX
