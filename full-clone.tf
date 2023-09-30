# Proxmox Full-Clone
# ---
# Create a new VM from a clone

# enter the the name of the new device
resource "proxmox_vm_qemu" "ansi-1" {

    # VM General Settings

    # which proxmox server should this be launched on?
    target_node = "192.168.100.11"
    # make sure this ID is unqiue.  If you reuse ID's you will get errors :)
    vmid = "103"
    # name of the new device again
    name = MICRO
    desc = "Description"

    # VM Advanced General Settings
    onboot = true

    # VM OS Settings
    clone = "VM 9000"

    # make sure to install qemu-guest-agent on image cloning
    # otherwise terafform will hang creating the vm
    agent = 1

    # VM CPU Settings
    # set cpu cores
    cores = 4
    sockets = 1
    cpu = "host"

    # VM Memory Settings
    # how much ram?
    memory = 4096

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # how big for the disk image?
    disk {
        storage = "local-lvm"
        type = "virtio"
        size = "8G"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # set to your network
    # ipconfig0 = "ip=192.168.100.7/24,gw=192.168.100.1"

    # (Optional) Default User
    ciuser = "shots"

    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDI8vhHs5zHKl18/9righr2wf4J6qmvRqHN0KJrquIiuFPeoJHBRni7wEuEqXOrLFtS+Hpqxl7b3nsZucgwPCAeYZUE9Hq3tqthyWQ8OiJYCxOEwD/tWMJnEhUgMd6pZOM+cIi4Ubt4DCiOGlHJrjLK1MSHifSULwYoJw96rayy0jF8nTBDKJK8o2CR1xFXb0gy4WPGKiEJbMlcIQ1p44qCAauqle2fsz+KzppXFofBW0qCyNuDwHk0ltsgss95QdxW1mF0s3KHz4ugpjuBMVwGqNVsZ+Ce7HWtbMx5tKMRA73zRLsFRJ+LAbDmZZQhHnoMjfmlzLDxen8tGRn6aIM7
    EOF
}
