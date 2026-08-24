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
Updated: 2026-08-24T12:31:22.462954+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.052 |  |
| ap-east-1 | 0.633 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.456 |  |
| ap-northeast-2 | 0.559 |  |
| ap-northeast-3 | 0.482 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.711 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.771 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.727 |  |
| ap-southeast-6 | 0.661 |  |
| ap-southeast-7 | 0.812 |  |
| ca-central-1 | 0.279 | 18 |
| ca-west-1 | 0.155 |  |
| eu-central-1 | 0.564 |  |
| eu-central-2 | 0.592 |  |
| eu-north-1 | 0.627 |  |
| eu-south-1 | 0.586 |  |
| eu-south-2 | 0.606 |  |
| eu-west-1 | 0.487 |  |
| eu-west-2 | 0.524 |  |
| eu-west-3 | 0.539 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.975 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.700 |  |
| us-east-1 | 0.240 | 5051 |
| us-east-2 | 0.232 | 1683 |
| us-gov-east-1 | 0.214 | 1878 |
| us-gov-west-1 | 0.119 | 227 |
| us-west-1 | 0.120 | 4045 |
| us-west-2 | 0.118 | 186 |

