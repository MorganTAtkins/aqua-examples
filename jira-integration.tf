resource "aquasec_notification" "jira_with_token" {
    name = "jira-example-with-token"
    type = "jira"
    properties = {
        url = "<JIRA-URL>"
        token = "<JIRA-TOKEN>"
        project_key = "<JIRA_PROJECT_KEY>"
        summary = "SOME_TEXT"
        definition_of_done = "Done"
    }
}

resource "aquasec_notification" "webhook" {
    name = "webhook-example"
    type = "webhook"
    properties = {
        url = "<WEBHOOK-URL>"
    }
}
