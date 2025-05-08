#### IAM Role ####
resource "aws_iam_role" "role-readonlyaccess-peer" { 
  name = "role-readonlyaccess-peer"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": ${jsonencode([for account in var.peer-accounts : "arn:aws:iam::${account}:root"])}
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
#### 명명규칙 : {Role명}-policya-{번호} ####
resource "aws_iam_role_policy_attachment" "role-readonlyaccess-peer-policya-1" { 
  role       = aws_iam_role.role-readonlyaccess-peer.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
