# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-25T09:45:10.217392+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.577 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.600 |  |
| ap-south-1 | 0.890 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.733 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.791 |  |
| ap-southeast-7 | 0.937 |  |
| ca-central-1 | 0.145 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.441 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.494 |  |
| eu-south-1 | 0.460 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.424 |  |
| il-central-1 | 0.630 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.801 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.541 |  |
| us-east-1 | 0.100 | 4180 |
| us-east-2 | 0.120 | 1379 |
| us-gov-east-1 | 0.111 | 1508 |
| us-gov-west-1 | 0.247 | 161 |
| us-west-1 | 0.214 | 3116 |
| us-west-2 | 0.248 | 130 |

