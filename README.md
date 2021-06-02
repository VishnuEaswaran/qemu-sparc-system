# qemu-sparc-system

Stepts to build and run the system

- Native Ubuntu 16.04

    1. Run the build.sh script
    2. Execute the start-qemu.sh script

    Dependencies: Ubuntu 16.04 with all buildroot dependencies,. qemu-system-sparc and openbios-sparc package.

- using docker from any system

    1. cd to"docker" directory
    2. Run the script "build.sh" for creating the necessary image
    3. Execute "run.sh" and "attach.sh" in succession for getting into the environemnt.
    4. Follw the steps in "Native Ubuntu 16.04" section for buildingthe linux system and running it using QEMU.

A SPARC V8 Linux system build source for running in QEMU.
