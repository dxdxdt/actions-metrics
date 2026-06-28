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
Updated: 2026-06-28T11:00:46.200863+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.857 |  |
| ap-southeast-1 | 0.769 |  |
| ap-southeast-2 | 0.649 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.699 |  |
| ap-southeast-5 | 0.786 |  |
| ap-southeast-6 | 0.688 |  |
| ap-southeast-7 | 0.876 |  |
| ca-central-1 | 0.235 | 16 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.567 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.564 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.701 |  |
| me-central-1 | 0.908 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.187 | 4797 |
| us-east-2 | 0.176 | 1644 |
| us-gov-east-1 | 0.188 | 1723 |
| us-gov-west-1 | 0.178 | 199 |
| us-west-1 | 0.123 | 3715 |
| us-west-2 | 0.176 | 163 |

