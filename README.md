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
Updated: 2026-04-24T13:26:18.153001+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.818 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.729 |  |
| ap-northeast-3 | 0.649 |  |
| ap-south-1 | 0.826 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.798 |  |
| ap-southeast-3 | 0.918 |  |
| ap-southeast-4 | 0.834 |  |
| ap-southeast-5 | 0.885 |  |
| ap-southeast-6 | 0.822 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.125 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.402 |  |
| eu-central-2 | 0.418 |  |
| eu-north-1 | 0.456 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.433 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.353 |  |
| eu-west-3 | 0.381 |  |
| il-central-1 | 0.555 |  |
| me-central-1 | 0.774 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.503 |  |
| us-east-1 | 0.070 | 4555 |
| us-east-2 | 0.096 | 1528 |
| us-gov-east-1 | 0.108 | 1662 |
| us-gov-west-1 | 0.303 | 194 |
| us-west-1 | 0.247 | 3468 |
| us-west-2 | 0.309 | 157 |

