# This policy doc is for CodeBuild jobs to publish
# objects to AWS CodeArtifact for builds.
# It can also be used to allow users to do the
# the same and access CodeArtifact from the
# AWS Console

data "aws_iam_policy_document" "policy_document" {

  statement {
    sid    = "AllowBrowseDomainsAndRepos"
    effect = "Allow"

    resources = [
      "*",
    ]

    actions = [
      "codeartifact:listrepositories",
      "codeartifact:listdomains"
    ]

  }

  statement {
    sid    = "AllowPublish"
    effect = "Allow"

    resources = [
      "arn:aws:codeartifact:*:263735779401:repository/*/*",
      "arn:aws:codeartifact:*:263735779401:package/*/*/*/*/*",
      "arn:aws:codeartifact:*:263735779401:domain/*/*"
    ]

    actions = [
      "codeartifact:UntagResource",
      "codeartifact:GetPackageVersionReadme",
      "codeartifact:ListTagsForResource",
      "codeartifact:DescribeRepository",
      "codeartifact:ListPackageVersionAssets",
      "codeartifact:ListDomains",
      "codeartifact:DescribeDomain",
      "codeartifact:DeletePackageVersions",
      "codeartifact:ListRepositories",
      "codeartifact:ListRepositoriesInDomain",
      "codeartifact:DescribePackageVersion",
      "codeartifact:CopyPackageVersions",
      "codeartifact:GetDomainPermissionsPolicy",
      "codeartifact:PutPackageMetadata",
      "codeartifact:DisposePackageVersions",
      "codeartifact:ListPackageVersionDependencies",
      "codeartifact:TagResource",
      "codeartifact:UpdatePackageVersionsStatus",
      "codeartifact:ListPackages",
      "codeartifact:GetAuthorizationToken",
      "codeartifact:ReadFromRepository",
      "codeartifact:GetRepositoryEndpoint",
      "codeartifact:PublishPackageVersion",
      "codeartifact:GetPackageVersionAsset",
      "codeartifact:GetRepositoryPermissionsPolicy",
      "codeartifact:ListPackageVersions"
    ]

  }

  statement {
    sid    = "AllowCreateRepos"
    effect = "Allow"

    resources = [
      "arn:aws:codeartifact:*:263735779401:repository/*/*",
      "arn:aws:codeartifact:*:263735779401:package/*/*/*/*/*",
      "arn:aws:codeartifact:*:263735779401:domain/*"
    ]

    actions = [
      "codeartifact:listrepositories",
      "codeartifact:createrepository",
      "codeartifact:listdomains"
    ]

  }

  statement {
    sid    = "AllowSTS"
    effect = "Allow"

    resources = [
      "*"
    ]

    actions = [
      "sts:GetServiceBearerToken"
    ]

    condition {
      test     = "StringEquals"
      variable = "sts:AWSServiceName"
      values = [
        "codeartifact.amazonaws.com"
      ]

    }
  }
}

output "policy_document" {
  value       = data.aws_iam_policy_document.policy_document.json
  description = "policy document"
}
