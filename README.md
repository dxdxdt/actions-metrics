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
Updated: 2026-10-25T16:57:39.490404+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.672 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.488 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.515 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.644 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.700 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.222 | 18 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.522 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.557 |  |
| eu-south-1 | 0.555 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.881 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.190 | 5159 |
| us-east-2 | 0.188 | 1710 |
| us-gov-east-1 | 0.189 | 1954 |
| us-gov-west-1 | 0.176 | 240 |
| us-west-1 | 0.112 | 4193 |
| us-west-2 | 0.176 | 195 |

