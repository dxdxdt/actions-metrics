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
Updated: 2026-08-16T00:48:55.161057+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.719 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.638 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.797 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.178 | 18 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.505 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.425 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.140 | 5004 |
| us-east-2 | 0.149 | 1679 |
| us-gov-east-1 | 0.130 | 1832 |
| us-gov-west-1 | 0.212 | 223 |
| us-west-1 | 0.181 | 3960 |
| us-west-2 | 0.213 | 178 |

