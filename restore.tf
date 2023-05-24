#provider
provider "aws" {
    profile =  "default"
    region = "us-west-2"
}

#resource
resource “aws_ami” “my_new_ami” {
    name="myAMI"
    virtualization_type="hvm"
    root_device_name="/dev/xvda"

    ebs_block_devices {
        device_name="/dev/xvda"
        snapshot_id=
        volume_size=8
        }
}

resource "aws_instance" "newmachine"{
    ami=${aws_ami.my_new_ami.id}
    instance_type="t2.micro"
    key_name="jenkey.pem"
}