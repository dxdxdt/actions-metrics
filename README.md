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
Updated: 2026-07-11T20:55:38.115313+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.077 |  |
| ap-east-1 | 0.625 |  |
| ap-east-2 | 0.561 |  |
| ap-northeast-1 | 0.447 |  |
| ap-northeast-2 | 0.551 |  |
| ap-northeast-3 | 0.473 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.700 |  |
| ap-southeast-2 | 0.576 |  |
| ap-southeast-3 | 0.755 |  |
| ap-southeast-4 | 0.619 |  |
| ap-southeast-5 | 0.722 |  |
| ap-southeast-6 | 0.612 |  |
| ap-southeast-7 | 0.803 |  |
| ca-central-1 | 0.320 | 16 |
| ca-west-1 | 0.179 |  |
| eu-central-1 | 0.599 |  |
| eu-central-2 | 0.621 |  |
| eu-north-1 | 0.657 |  |
| eu-south-1 | 0.649 |  |
| eu-south-2 | 0.637 |  |
| eu-west-1 | 0.528 |  |
| eu-west-2 | 0.565 |  |
| eu-west-3 | 0.582 |  |
| il-central-1 | 0.763 |  |
| me-central-1 | 0.968 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.708 |  |
| us-east-1 | 0.260 | 4850 |
| us-east-2 | 0.261 | 1656 |
| us-gov-east-1 | 0.235 | 1738 |
| us-gov-west-1 | 0.108 | 202 |
| us-west-1 | 0.049 | 3769 |
| us-west-2 | 0.105 | 165 |

