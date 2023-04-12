data "aws_iam_policy_document" "gitlab_mirroring" {
  statement {
    sid = "MinimumGitLabPushMirroringPermissions"

    actions = [
      "codecommit:GitPull",
      "codecommit:GitPush",
    ]

    resources = [
      aws_codecommit_repository.this.arn,
    ]
  }
}
