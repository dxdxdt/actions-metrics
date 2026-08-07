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
Updated: 2026-08-07T12:43:35.346895+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.034 |  |
| ap-east-1 | 0.641 |  |
| ap-east-2 | 0.579 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.572 |  |
| ap-northeast-3 | 0.486 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.720 |  |
| ap-southeast-2 | 0.615 |  |
| ap-southeast-3 | 0.785 |  |
| ap-southeast-4 | 0.657 |  |
| ap-southeast-5 | 0.739 |  |
| ap-southeast-6 | 0.692 |  |
| ap-southeast-7 | 0.821 |  |
| ca-central-1 | 0.290 | 18 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.550 |  |
| eu-central-2 | 0.565 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.582 |  |
| eu-west-1 | 0.513 |  |
| eu-west-2 | 0.508 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.710 |  |
| me-central-1 | 0.944 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.678 |  |
| us-east-1 | 0.230 | 4949 |
| us-east-2 | 0.233 | 1675 |
| us-gov-east-1 | 0.222 | 1806 |
| us-gov-west-1 | 0.147 | 211 |
| us-west-1 | 0.086 | 3894 |
| us-west-2 | 0.144 | 172 |

