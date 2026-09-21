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
Updated: 2026-09-21T21:29:38.314023+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.520 |  |
| ap-south-1 | 0.928 |  |
| ap-south-2 | 0.938 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.648 |  |
| ap-southeast-3 | 0.819 |  |
| ap-southeast-4 | 0.695 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.225 | 18 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.523 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.547 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.441 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.715 |  |
| me-central-1 | 0.908 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.190 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.176 | 5111 |
| us-east-2 | 0.180 | 1686 |
| us-gov-east-1 | 0.169 | 1923 |
| us-gov-west-1 | 0.181 | 234 |
| us-west-1 | 0.120 | 4132 |
| us-west-2 | 0.180 | 192 |

