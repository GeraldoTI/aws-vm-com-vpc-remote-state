recurso  "aws_key_pair"  "chave"  {
  key_name    =  "chave-aws"
  public_key  =  file ( "./aws-key.pub" )
}

recurso  "aws_instance"  "vm"  {
  ami                          =  "ami-0d527b8c289b4af7f"
  instance_type                =  "t2.micro"
  key_name                     =  aws_key_pair . chave . key_name
  subnet_id                    =  dados . terraform_remote_state . vpc . saídas . subnet_id
  vpc_security_group_ids       =  [ dados . terraform_remote_state . vpc . saídas . security_group_id ]
  associado_public_ip_address  =  true

  marcas  =  {
    "Nome"  =  "vm-terraform"
  }
}
