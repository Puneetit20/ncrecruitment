resource_group_name = "gaim-eastus2-dev-core-rg-01"

load_balancers = {
  loadbalancer1 = {
    name = "gaim-eastus2-dev-app-lb-01"
    sku  = "Standard"
    frontend_ips = [
      {
        name                      = "appvmlbfrontend01"
        subnet_name               = "eastus2-14152-dev-vnet-01-app-snet-01"
        vnet_name                 = "eastus2-14152-dev-vnet-01" #"jstartvmssfirst"
        networking_resource_group = "gaim-eastus2-dev-core-rg-01"
        static_ip                 = null # "10.0.1.4" #(Optional) Set null to get dynamic IP 
        zones                     = ["1"]
      },
      {
        name                      = "appvmlbfrontend02"
        subnet_name               = "eastus2-14152-dev-vnet-01-app-snet-01"
        vnet_name                 = "eastus2-14152-dev-vnet-01" #"jstartvmssfirst"
        networking_resource_group = "gaim-eastus2-dev-core-rg-01"
        static_ip                 = null # "10.0.1.4" #(Optional) Set null to get dynamic IP 
        zones                     = ["1"]
      },
      {
        name                      = "appvmlbfrontend03"
        subnet_name               = "eastus2-14152-dev-vnet-01-app-snet-01"
        vnet_name                 = "eastus2-14152-dev-vnet-01" #"jstartvmssfirst"
        networking_resource_group = "gaim-eastus2-dev-core-rg-01"
        static_ip                 = null # "10.0.1.4" #(Optional) Set null to get dynamic IP 
        zones                     = ["1"]
      }
    ]
    backend_pool_names = ["appvmlbbackend01","appvmlbbackend02","appvmlbbackend03"]
    enable_public_ip   = false # set this to true to if you want to create public load balancer
    public_ip_name     = null
  },
   loadbalancer2 = {
    name = "gaim-eastus2-dev-web-lb-01"
    sku  = "Standard"
    frontend_ips = [
      {
        name                      = "webvmlbfrontend"
        subnet_name               = "eastus2-14152-dev-vnet-01-web-snet-01"
        vnet_name                 = "eastus2-14152-dev-vnet-01" #"jstartvmssfirst"
        networking_resource_group = "gaim-eastus2-dev-core-rg-01"
        static_ip                 = null # "10.0.1.4" #(Optional) Set null to get dynamic IP 
        zones                     = ["1"]
      }
    ]
    backend_pool_names = ["webvmlbbackend"]
    enable_public_ip   = false # set this to true to if you want to create public load balancer
    public_ip_name     = null
  }
}

load_balancer_rules = {
  loadbalancerrules1 = {
    name                      = "cd-to-vm01"
    lb_key                    = "loadbalancer1"
    frontend_ip_name          = "appvmlbfrontend01"
    backend_pool_name         = "appvmlbbackend01"
    lb_protocol               = null
    lb_port                   = "1364"
    probe_port                = "1364"
    backend_port              = "1364"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules2 = {
    name                      = "scp-to-vm01"
    lb_key                    = "loadbalancer1"
    frontend_ip_name          = "appvmlbfrontend01"
    backend_pool_name         = "appvmlbbackend01"
    lb_protocol               = null
    lb_port                   = "22"
    probe_port                = "22"
    backend_port              = "22"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules3 = {
    name                      = "cd-to-vm02"
    lb_key                    = "loadbalancer1"
    frontend_ip_name          = "appvmlbfrontend02"
    backend_pool_name         = "appvmlbbackend02"
    lb_protocol               = null
    lb_port                   = "1364"
    probe_port                = "1364"
    backend_port              = "1364"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules4 = {
    name                      = "scp-to-vm02"
    lb_key                    = "loadbalancer1"
    frontend_ip_name          = "appvmlbfrontend02"
    backend_pool_name         = "appvmlbbackend02"
    lb_protocol               = null
    lb_port                   = "22"
    probe_port                = "22"
    backend_port              = "22"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules5 = {
    name                      = "cd-to-vm03"
    lb_key                    = "loadbalancer1"
    frontend_ip_name          = "appvmlbfrontend03"
    backend_pool_name         = "appvmlbbackend03"
    lb_protocol               = null
    lb_port                   = "1364"
    probe_port                = "1364"
    backend_port              = "1364"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules6 = {
    name                      = "scp-to-vm03"
    lb_key                    = "loadbalancer1"
    frontend_ip_name          = "appvmlbfrontend03"
    backend_pool_name         = "appvmlbbackend03"
    lb_protocol               = null
    lb_port                   = "22"
    probe_port                = "22"
    backend_port              = "22"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules8 = {
    name                      = "https-to-webvm"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "443"
    probe_port                = "443"
    backend_port              = "443"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules9 = {
    name                      = "ssh-to-webvm"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "22"
    probe_port                = "22"
    backend_port              = "22"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules9 = {
    name                      = "adminconsole"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "9043"
    probe_port                = "9043"
    backend_port              = "9043"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules9 = {
    name                      = "WAS"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "9080"
    probe_port                = "9080"
    backend_port              = "9080"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules10 = {
    name                      = "Transportport"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "8002"
    probe_port                = "8002"
    backend_port              = "8002"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules11 = {
    name                      = "Consoleport"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "8003"
    probe_port                = "8003"
    backend_port              = "8003"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules12 = {
    name                      = "transport01"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "8004"
    probe_port                = "8004"
    backend_port              = "8004"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules13 = {
    name                      = "consolesecureport"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "8005"
    probe_port                = "8005"
    backend_port              = "8005"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules14 = {
    name                      = "Bootstrap"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "8006"
    probe_port                = "8006"
    backend_port              = "8006"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  },
  loadbalancerrules15 = {
    name                      = "soapconnector"
    lb_key                    = "loadbalancer2"
    frontend_ip_name          = "webvmlbfrontend"
    backend_pool_name         = "webvmlbbackend"
    lb_protocol               = null
    lb_port                   = "8007"
    probe_port                = "8007"
    backend_port              = "8007"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  }
}


load_balancer_nat_pools = {}

lb_outbound_rules = {
}

load_balancer_nat_rules = {
}

lb_additional_tags = {
  iac          = "Terraform"
  env          = "dev"
  automated_by = "ado-dev-14152-gaim"
}