resource "aws_key_pair" "chavo" {
  key_name   = "chavo"
  public_key = "${file("./id_rsa.pub")}"
}
