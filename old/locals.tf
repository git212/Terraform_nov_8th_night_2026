locals {
  az_names = data.aws_availability_zones.azs.names
  acc_id = data.aws_caller_identity.user.account_id
  sub_ids = aws_subnet.main.*.id
}