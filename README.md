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
Updated: 2026-08-18T04:27:23.202357+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.515 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.747 |  |
| ap-southeast-2 | 0.644 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.691 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.679 |  |
| ap-southeast-7 | 0.847 |  |
| ca-central-1 | 0.239 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.572 |  |
| eu-south-1 | 0.549 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.499 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.179 | 5014 |
| us-east-2 | 0.198 | 1680 |
| us-gov-east-1 | 0.188 | 1842 |
| us-gov-west-1 | 0.177 | 224 |
| us-west-1 | 0.114 | 3984 |
| us-west-2 | 0.177 | 181 |

