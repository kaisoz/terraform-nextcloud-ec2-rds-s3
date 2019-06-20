resource "aws_instance" "nextcloud_app_instance"{
    ami = data.aws_ami.ubuntu_bionic_lts.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.nextcloud_app_sg.id]
    subnet_id = var.subnet_id

    key_name = var.key_name

    tags = {
        Name = "Nextcloud app"
    }

    user_data = "${data.template_cloudinit_config.cloudinit-nextcloud.rendered}"
}

resource "aws_security_group" "nextcloud_app_sg" {
    name = "nextcloud_app_sg"

    ingress {
        from_port="80"
        to_port="80"
        protocol="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port="22"
        to_port="22"
        protocol="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    vpc_id = var.vpc_id

    lifecycle {
        create_before_destroy = true
    }
}
