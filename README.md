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
Updated: 2026-06-13T19:11:41.981564+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.804 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.629 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.652 |  |
| ap-south-1 | 0.838 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.882 |  |
| ap-southeast-2 | 0.763 |  |
| ap-southeast-3 | 0.937 |  |
| ap-southeast-4 | 0.809 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.447 |  |
| eu-south-2 | 0.437 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.369 |  |
| eu-west-3 | 0.386 |  |
| il-central-1 | 0.568 |  |
| me-central-1 | 0.781 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.082 | 4753 |
| us-east-2 | 0.101 | 1633 |
| us-gov-east-1 | 0.102 | 1712 |
| us-gov-west-1 | 0.294 | 198 |
| us-west-1 | 0.233 | 3661 |
| us-west-2 | 0.297 | 163 |

