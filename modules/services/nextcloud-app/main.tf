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

    #user_data = templatefile("${path.module}/scripts/nextcloud_installer.sh", { 

    #                aws_region = var.aws_region,

    #                db_name = var.db_name, 
    #                db_user = var.db_user, 
    #                db_pass = var.db_pass, 
    #                db_endpoint = var.db_endpoint 

    #                admin_user = var.admin_user,
    #                admin_pass = var.admin_pass,
    #                data_dir = var.data_dir,

    #                s3_bucket_name = var.s3_bucket_name,
    #                user_access_key = var.s3_access_key,
    #                user_secret_key = var.s3_secret_key
    #            })
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