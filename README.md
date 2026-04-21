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
Updated: 2026-04-21T01:53:02.586035+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.666 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.658 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.860 |  |
| ap-southeast-4 | 0.763 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.906 |  |
| ca-central-1 | 0.141 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.121 | 4534 |
| us-east-2 | 0.097 | 1521 |
| us-gov-east-1 | 0.101 | 1657 |
| us-gov-west-1 | 0.226 | 194 |
| us-west-1 | 0.174 | 3452 |
| us-west-2 | 0.228 | 156 |

