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
Updated: 2026-02-25T04:13:21.938131+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.563 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.822 |  |
| ap-southeast-2 | 0.725 |  |
| ap-southeast-3 | 0.864 |  |
| ap-southeast-4 | 0.772 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.913 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.482 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.386 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.811 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.566 |  |
| us-east-1 | 0.107 | 4179 |
| us-east-2 | 0.083 | 1378 |
| us-gov-east-1 | 0.081 | 1506 |
| us-gov-west-1 | 0.212 | 161 |
| us-west-1 | 0.223 | 3115 |
| us-west-2 | 0.208 | 130 |

