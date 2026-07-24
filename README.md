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
Updated: 2026-07-24T22:59:17.265490+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.036 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.612 |  |
| ap-northeast-1 | 0.494 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.522 |  |
| ap-south-1 | 0.926 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.755 |  |
| ap-southeast-2 | 0.642 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.690 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.683 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.265 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.620 |  |
| eu-south-1 | 0.588 |  |
| eu-south-2 | 0.586 |  |
| eu-west-1 | 0.486 |  |
| eu-west-2 | 0.524 |  |
| eu-west-3 | 0.537 |  |
| il-central-1 | 0.724 |  |
| me-central-1 | 0.935 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.215 | 4905 |
| us-east-2 | 0.204 | 1662 |
| us-gov-east-1 | 0.201 | 1777 |
| us-gov-west-1 | 0.181 | 206 |
| us-west-1 | 0.119 | 3829 |
| us-west-2 | 0.180 | 170 |

