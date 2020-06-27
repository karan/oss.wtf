# oss.wtf

Get free subdomains for your OSS projects.

![Terraform](https://github.com/karan/oss.wtf/workflows/Terraform/badge.svg?branch=master)

For a project name `foo`, you can have your own subdomain `foo.oss.wtf`. Just add a simple configuration.

## How

In `[oss.wtf]`(https://github.com/karan/oss.wtf/tree/master/oss.wtf) directory, add a file called `foo.tf` with contents:

```
resource "google_dns_record_set" "foo-oss-wtf" {
  name         = "foo.oss.wtf."
  managed_zone = "oss-wtf"
  type         = "A"
  ttl          = 300

  rrdatas = ["1.3.3.7"]
}
```

1. Change `foo` in `foo.oss.wtf.` and `foo-oss-wtf` to your subdomain. Change the `rrdatas` IP to your service's IP.

1. You can set pretty much any DNS record. Follow the [guide here](https://www.terraform.io/docs/providers/google/r/dns_record_set.html).

1. Send a PR and as soon as it's checked in, the DNS record should be set soon after.

### Testing

To check if the DNS policy is set, try `dig`:

```
$ dig @1.1.1.1 foo.oss.wtf | grep -A 1 "ANSWER SECTION"
;; ANSWER SECTION:
foo.oss.wtf.        281 IN  A   1.3.3.7
```

## Policy

This is a side project for me, and I really want to optimize for least amount of effort and stress for the both of us.

You should know the following rules:

1. This is a side project for me, and not a job.

1. I do not provide any SLOs or guarantees on either PR reviews, or support.

1. The DNS is Google so it's pretty stable, but sometimes software breaks. Do not yell at me if that happens.

1. I will only approve subdomains for webpages related to OSS projects. As such, your PR must include a link to a public repo for your project.

1. I will allow most content. I will not allow anything illegal, hateful, hurtful, shady, spammy etc. I have final say over what goes in.

1. I can remove your subdomain if you are being a jerk (to me, or to others). I do not owe you an explanation in that case.

1. If I decide to end this project, I will try my best to let you know (with a \~30 day notice).

1. This is a side project for me, and not a job.

## Developing

On Github, set the following secrets:

1. `GCPPROJECT` - string name of the GCP project

1. `ACCOUNTJSON` - The string content of a GCP service account

To test locally,

```
$ ./oss.wtf/run.sh $GCP_PROJECT_NAME
```

Inspired by [yarmo](https://fosstodon.org/@yarmo)
