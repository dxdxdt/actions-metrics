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
Updated: 2026-09-06T16:36:54.214114+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.520 |  |
| ap-northeast-2 | 0.624 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.661 |  |
| ap-southeast-3 | 0.831 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.713 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.230 | 18 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.495 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.560 |  |
| eu-south-1 | 0.535 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.430 |  |
| eu-west-2 | 0.467 |  |
| eu-west-3 | 0.478 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.911 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.172 | 5088 |
| us-east-2 | 0.180 | 1685 |
| us-gov-east-1 | 0.183 | 1898 |
| us-gov-west-1 | 0.198 | 231 |
| us-west-1 | 0.134 | 4086 |
| us-west-2 | 0.197 | 192 |

