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
Updated: 2026-08-08T01:00:40.938098+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.627 |  |
| ap-east-2 | 0.565 |  |
| ap-northeast-1 | 0.448 |  |
| ap-northeast-2 | 0.552 |  |
| ap-northeast-3 | 0.475 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.707 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.762 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.726 |  |
| ap-southeast-6 | 0.676 |  |
| ap-southeast-7 | 0.807 |  |
| ca-central-1 | 0.279 | 18 |
| ca-west-1 | 0.166 |  |
| eu-central-1 | 0.543 |  |
| eu-central-2 | 0.560 |  |
| eu-north-1 | 0.588 |  |
| eu-south-1 | 0.581 |  |
| eu-south-2 | 0.582 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.531 |  |
| il-central-1 | 0.707 |  |
| me-central-1 | 0.935 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.681 |  |
| us-east-1 | 0.240 | 4953 |
| us-east-2 | 0.228 | 1675 |
| us-gov-east-1 | 0.205 | 1809 |
| us-gov-west-1 | 0.122 | 212 |
| us-west-1 | 0.123 | 3896 |
| us-west-2 | 0.123 | 173 |

