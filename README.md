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
Updated: 2026-06-06T19:08:22.939825+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.041 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.589 |  |
| ap-northeast-1 | 0.476 |  |
| ap-northeast-2 | 0.580 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.620 |  |
| ap-southeast-3 | 0.789 |  |
| ap-southeast-4 | 0.661 |  |
| ap-southeast-5 | 0.748 |  |
| ap-southeast-6 | 0.657 |  |
| ap-southeast-7 | 0.836 |  |
| ca-central-1 | 0.279 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.579 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.594 |  |
| eu-south-2 | 0.589 |  |
| eu-west-1 | 0.476 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.536 |  |
| il-central-1 | 0.713 |  |
| me-central-1 | 0.934 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.671 |  |
| us-east-1 | 0.215 | 4729 |
| us-east-2 | 0.192 | 1626 |
| us-gov-east-1 | 0.203 | 1709 |
| us-gov-west-1 | 0.144 | 197 |
| us-west-1 | 0.091 | 3638 |
| us-west-2 | 0.143 | 162 |

