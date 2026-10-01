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
Updated: 2026-10-01T06:45:28.035228+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.546 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.797 |  |
| ap-southeast-2 | 0.657 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.701 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.878 |  |
| ca-central-1 | 0.222 | 18 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.549 |  |
| eu-south-1 | 0.528 |  |
| eu-south-2 | 0.527 |  |
| eu-west-1 | 0.422 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.484 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.253 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.179 | 5132 |
| us-east-2 | 0.168 | 1687 |
| us-gov-east-1 | 0.196 | 1931 |
| us-gov-west-1 | 0.184 | 236 |
| us-west-1 | 0.129 | 4149 |
| us-west-2 | 0.185 | 192 |

