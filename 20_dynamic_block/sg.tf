variable "sg_ports" {
    type = list(number)
    default = [ 8200, 8201, 8300, 9200, 9500 ]
  
}



resource "aws_security_group" "hands_on_sg" {
    name = "hands_on_sg"

    dynamic "ingress" {
        for_each = var.sg_ports
        iterator = port
        content {
          from_port = port.value
          to_port = port.value
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      
    }
    
  
}