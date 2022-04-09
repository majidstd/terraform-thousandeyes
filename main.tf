terraform {
  required_providers {
    thousandeyes = {
      source = "william20111/thousandeyes"
      version = "0.6.0"
    }
  }
}


provider "thousandeyes" {
  token = var.te_token
}


data "thousandeyes_agent" "thousandeyes-va" {
  name  = "thousandeyes-va"

}


resource "thousandeyes_agent_to_server" "agent_to_google_com" {
  test_name = "agent_to_google.com"
  interval = 120
  server = "google.com"
  agents {
      agent_id = data.thousandeyes_agent.thousandeyes-va.agent_id
  }

}


resource "thousandeyes_http_server" "google_http_test" {
  test_name = "google test"
  interval = 120
  url = "https://google.com"
  agents {
      agent_id = data.thousandeyes_agent.thousandeyes-va.agent_id
  }
  agents {

      agent_id = 12345
  }
}
