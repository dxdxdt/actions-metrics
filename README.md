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
Updated: 2026-10-26T05:39:21.223817+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.884 |  |
| ap-east-1 | 0.787 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.610 |  |
| ap-northeast-2 | 0.715 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.976 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.923 |  |
| ap-southeast-4 | 0.845 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.106 | 18 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.403 |  |
| eu-central-2 | 0.429 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.417 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.556 |  |
| me-central-1 | 0.750 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.064 | 5161 |
| us-east-2 | 0.092 | 1711 |
| us-gov-east-1 | 0.101 | 1954 |
| us-gov-west-1 | 0.287 | 240 |
| us-west-1 | 0.235 | 4194 |
| us-west-2 | 0.286 | 195 |

