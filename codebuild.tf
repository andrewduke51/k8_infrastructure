# codebuild to build ec2 or docker container or applications

resource "aws_codebuild_project" "ubuntu_docker" {
  name          = "test-project"
  description   = "test_codebuild_project"
  build_timeout = "5"
  service_role  = "${aws_iam_role.codebuild.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "user"
      value = "ubuntu"
    }
    environment_variable {
      name = "RUN_ENV"
      value = "CoStar"
    }
    environment_variable {
      name = "THE_SECRET"
      value = "/CodeBuild/THE_SECRET"
      type = "PARAMETER_STORE"
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/andrewduke51/various_ansible_projects"
    buildspec       = "builds/ubuntu-base/buildspec.yml"

    auth {
      type = "OAUTH"
      resource = "AWS CodeBuild"
    }
  }


  tags = {
    Environment = "Test"
  }
}