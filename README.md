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
Updated: 2026-06-12T07:16:08.023475+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.802 |  |
| ap-east-2 | 0.738 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.734 |  |
| ap-northeast-3 | 0.649 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.787 |  |
| ap-southeast-3 | 0.931 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.894 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.098 | 16 |
| ca-west-1 | 0.281 |  |
| eu-central-1 | 0.396 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.439 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.432 |  |
| eu-west-1 | 0.318 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.551 |  |
| me-central-1 | 0.792 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.060 | 4745 |
| us-east-2 | 0.072 | 1632 |
| us-gov-east-1 | 0.083 | 1711 |
| us-gov-west-1 | 0.296 | 198 |
| us-west-1 | 0.250 | 3658 |
| us-west-2 | 0.296 | 162 |

