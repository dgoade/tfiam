# This policy document allows IAM users in our AWS
# account to manage their own credentials and requires
# that they configure an MFA device
# reference: https://tinyurl.com/4cx4zsy7

data "aws_iam_policy_document" "policy_document" {

  statement {
    sid    = "AllowViewAccountInfo"
    effect = "Allow"

    actions = [
      "iam:GetAccountPasswordPolicy",
      "iam:ListVirtualMFADevices",
    ]
    resources = [
      "*"
    ]

  }

  statement {
    sid    = "AllowManageOwnPasswords"
    effect = "Allow"

    actions = [
      "iam:ChangePassword",
      "iam:GetUser",
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {
    sid    = "AllowManageOwnAccessKeys"
    effect = "Allow"

    actions = [
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey",
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {
    sid    = "AllowManageOwnSigningCertificates"
    effect = "Allow"

    actions = [
      "iam:DeleteSigningCertificate",
      "iam:ListSigningCertificates",
      "iam:UpdateSigningCertificate",
      "iam:UploadSigningCertificate",
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {
    sid    = "AllowManageOwnSSHPublicKeys"
    effect = "Allow"

    actions = [
      "iam:DeleteSSHPublicKey",
      "iam:GetSSHPublicKey",
      "iam:ListSSHPublicKeys",
      "iam:UpdateSSHPublicKey",
      "iam:UploadSSHPublicKey"
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {
    sid    = "AllowManageOwnGitCredentials"
    effect = "Allow"

    actions = [
      "iam:CreateServiceSpecificCredential",
      "iam:DeleteServiceSpecificCredential",
      "iam:ListServiceSpecificCredentials",
      "iam:ResetServiceSpecificCredential",
      "iam:UpdateServiceSpecificCredential",
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {
    sid    = "AllowManageOwnVirtualMFADevice"
    effect = "Allow"

    actions = [
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice",
    ]

    resources = [
      "arn:aws:iam::*:mfa/$${aws:username}"
    ]

  }

  statement {
    sid    = "AllowManageOwnUserMFA"
    effect = "Allow"

    actions = [
      "iam:DeactivateMFADevice",
      "iam:EnableMFADevice",
      "iam:ListMFADevices",
      "iam:ResyncMFADevice",
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}"
    ]

  }

  statement {
    sid    = "DenyAllExceptListedIfNoMFA"
    effect = "Deny"

    not_actions = [
      "iam:CreateVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:GetUser",
      "iam:ListMFADevices",
      "iam:ListVirtualMFADevices",
      "iam:ResyncMFADevice",
      "sts:GetSessionToken",
    ]

    resources = [
      "*"
    ]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"

      values = [
        "false",
      ]
    }

  }

}

output "policy_document" {
  value       = data.aws_iam_policy_document.policy_document.json
  description = "policy document"
}
