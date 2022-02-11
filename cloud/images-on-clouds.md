# Overview of Image Upload and Availability of Common Operating Systems across Clouds

## Offical and custom image support

| Item                      | AWS                            | Azure  | GCP    | DigitalOcean |
| ------------------------- | ------------------------------ | ------ | ------ | ------------ |
| Import images?            | Yes                            | Yes    | Yes    | No           |
| Imported image formats    | OVA, VMDK, VHD, VHDX, raw, OVF |        |        |              |
| Unsupported distributions | Fedora                         | Fedora | Fedora | NA           |
| Platform-SLA              |                                |        |        |              |

## Support for common distributions

| Distribution   | AWS | Azure | GCP | DigitalOcean |
| -------------- | --- | ----- | --- | ------------ |
| Debian support |     |       |     |
| Ubuntu support |     |       |     |
| Fedora support |     |       |     |

https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/imaging
https://cloud.google.com/compute/docs/import/import-existing-image

## FAQ

1. What is an "endorsed distribution" on Azure?
1. Fedora
   1. What is anaconda
   1. What are udpates in dnf list --installed
   1. What is diff between available, installed, extras, updates, upgrades, autoremove and recent?
   1. What is the versioning guideline?
1. How do I list all the repos on system?

   1. Fedora

   ```shell
   dnf repolist
   ```

   1. Default:

      1. fedora
      1. fedora-cisco-openh264
      1. fedora-modular
      1. updates
      1. updates-modular

   1. Ubuntu

   ```shell

   ```

   1. Debian

   ```shell

   ```

1. How do I list all the packages installed on my system along with their source?
