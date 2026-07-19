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
Updated: 2026-07-19T17:52:24.881080+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.078 |  |
| ap-east-1 | 0.629 |  |
| ap-east-2 | 0.571 |  |
| ap-northeast-1 | 0.451 |  |
| ap-northeast-2 | 0.559 |  |
| ap-northeast-3 | 0.491 |  |
| ap-south-1 | 0.939 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.719 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.774 |  |
| ap-southeast-4 | 0.681 |  |
| ap-southeast-5 | 0.740 |  |
| ap-southeast-6 | 0.673 |  |
| ap-southeast-7 | 0.809 |  |
| ca-central-1 | 0.280 | 16 |
| ca-west-1 | 0.188 |  |
| eu-central-1 | 0.564 |  |
| eu-central-2 | 0.581 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.601 |  |
| eu-south-2 | 0.595 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.516 |  |
| eu-west-3 | 0.544 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.964 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.684 |  |
| us-east-1 | 0.232 | 4885 |
| us-east-2 | 0.235 | 1657 |
| us-gov-east-1 | 0.209 | 1770 |
| us-gov-west-1 | 0.123 | 205 |
| us-west-1 | 0.116 | 3805 |
| us-west-2 | 0.124 | 167 |

