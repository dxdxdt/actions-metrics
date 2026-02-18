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
Updated: 2026-02-18T23:22:55.019609+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.998 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.505 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.668 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.783 |  |
| ap-southeast-6 | 0.717 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.242 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.544 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.489 |  |
| il-central-1 | 0.711 |  |
| me-central-1 | 0.908 |  |
| me-south-1 | 0.879 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.610 |  |
| us-east-1 | 0.181 | 4140 |
| us-east-2 | 0.176 | 1354 |
| us-gov-east-1 | 0.181 | 1491 |
| us-gov-west-1 | 0.197 | 155 |
| us-west-1 | 0.143 | 3077 |
| us-west-2 | 0.199 | 128 |

