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
Updated: 2026-07-12T20:03:26.345360+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.799 |  |
| ap-east-2 | 0.736 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.726 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.872 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.924 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.975 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.400 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.447 |  |
| eu-south-1 | 0.439 |  |
| eu-south-2 | 0.447 |  |
| eu-west-1 | 0.331 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.387 |  |
| il-central-1 | 0.560 |  |
| me-central-1 | 0.778 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.062 | 4859 |
| us-east-2 | 0.078 | 1656 |
| us-gov-east-1 | 0.075 | 1741 |
| us-gov-west-1 | 0.291 | 202 |
| us-west-1 | 0.236 | 3772 |
| us-west-2 | 0.292 | 165 |

