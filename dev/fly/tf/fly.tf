# set FLY_API_TOKEN before running.
# export FLY_API_TOKEN=`flyctl auth token

terraform {
  required_providers {
    fly = {
      source = "fly-apps/fly"
    }
  }
}

provider "fly" {
}

resource "fly_app" "seSupervisions" {
  name = "se-supervisions"
}

resource "fly_volume" "seVolume" {
  name = "se_supervisions_volume"
  app = fly_app.seSupervisions.name
  size = 10
  region = "lhr"
  depends_on = [ fly_app.seSupervisions ]
}

resource "fly_cert" "seCert" {
  app = fly_app.seSupervisions.name
  hostname = "sup2.rrw.me.uk"
}

