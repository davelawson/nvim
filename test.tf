data "template_file" "userdata-app-high-priority" {
  template = file("app-cloud-config.yaml")

  vars = {
    class                        = var.inventory_code_tag
    scollector_url               = var.scollector_url
    product_code_tag             = var.product_code_tag
    product_name                 = var.product_name
    environment_tag              = var.environment_tag
    environment_tag_falcon       = var.environment_tag_falcon
    inventory_code_tag           = var.inventory_code_tag
    cadvisor_url                 = var.cadvisor_url
    cadvisor_port                = var.cadvisor_port
    aws_profile                  = var.aws_profile
    aws_region                   = var.aws_region
    config_repo                  = var.config_repo
    git_branch                   = var.git_branch
    env_path                     = "${var.env_path}-priority"
    artifact_docker              = var.app_instance_docker_image
    artifact_version             = var.app_instance_artifact_version
    log_path                     = var.log_path
    log_forwarder_version        = var.log_forwarder_version
    log_kafka_brokers            = var.log_kafka_brokers
    log_kafka_topic              = var.log_kafka_topic
    heap_size_percentage         = var.heap_size_percentage
    app_args                     = var.app_args
    presence_ssh_key             = module.presence_ssh_key.presence_ssh_key
    docker_log_max_size          = var.docker_log_max_size
    docker_log_max_file          = var.docker_log_max_file
    app_instance_management_port = var.app_instance_management_port
  }
}

resource "aws_launch_configuration" "app-high-priority" {
  name_prefix   = "${module.naming.aws_launch_configuration}-"
  image_id      = module.ami.ami_id
  instance_type = var.app_instance_type
  security_groups = [
    module.networks.security_groups[format("%s.%s.%s", var.aws_region, var.vpc, "app")],
    module.networks.security_groups[format("%s.%s.%s", var.aws_region, var.vpc, "onprem")]
  ]
  user_data            = data.template_file.userdata-app-high-priority.rendered
  key_name             = var.ssh_key
  iam_instance_profile = aws_iam_instance_profile.app.name
  enable_monitoring    = var.enable_monitoring
  ebs_optimized        = var.app_instance_ebs_optimized

  root_block_device {
    volume_type = "gp3"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "optional"
    http_put_response_hop_limit = 3
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app-high-priority" {
  name                 = aws_launch_configuration.app-high-priority.name
  min_size             = var.app_instance_min_count_high_priority
  max_size             = var.app_instance_max_count_high_priority
  desired_capacity     = var.app_instance_min_count_high_priority
  count                = var.app_instance_min_count_high_priority > 0 ? 1 : 0
  health_check_type    = var.asg_health_check_type
  force_delete         = true
  launch_configuration = aws_launch_configuration.app-high-priority.id
  vpc_zone_identifier = split(
    ",",
    module.networks.subnets[format("%s.%s.%s", var.aws_region, var.vpc, "app")],
  )
  termination_policies = [var.asg_termination_policies]
  enabled_metrics = [
    "GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances",
    "GroupTerminatingInstances", "GroupTotalInstances"
  ]
  wait_for_capacity_timeout = "10m"
  min_elb_capacity          = var.app_elb_min_capacity

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${module.naming.aws_autoscaling_group}app-high-priority"
    propagate_at_launch = true
  }

  tag {
    key                 = "ProductCode"
    value               = var.product_code_tag
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment_tag
    propagate_at_launch = true
  }

  tag {
    key                 = "InventoryCode"
    value               = var.inventory_code_tag
    propagate_at_launch = true
  }

  tag {
    key                 = "PrometheusDnsmasq"
    value               = "enabled"
    propagate_at_launch = true
  }

  tag {
    key                 = "PrometheusIPTABLES"
    value               = "disabled"
    propagate_at_launch = true
  }

  tag {
    key                 = "BusinessHours"
    value               = var.business_hours
    propagate_at_launch = true
  }

  tag {
    key                 = "RuntimeHours"
    value               = var.runtime_hours
    propagate_at_launch = true
  }

  tag {
    key                 = "Prometheus"
    value               = "enabled"
    propagate_at_launch = true
  }

  tag {
    key                 = "PrometheusCadvisor"
    value               = "enabled"
    propagate_at_launch = true
  }

  tag {
    key                 = "PrometheusST"
    value               = "enabled"
    propagate_at_launch = true
  }

  tag {
    key                 = "PrometheusCustom"
    value               = "enabled"
    propagate_at_launch = true
  }

  tag {
    key                 = "management.port"
    value               = var.app_instance_management_port
    propagate_at_launch = true
  }

}

