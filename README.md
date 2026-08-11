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
Updated: 2026-08-11T22:34:00.856220+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.495 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.654 |  |
| ap-southeast-3 | 0.819 |  |
| ap-southeast-4 | 0.699 |  |
| ap-southeast-5 | 0.786 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.868 |  |
| ca-central-1 | 0.259 | 18 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.549 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.554 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.452 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.490 |  |
| il-central-1 | 0.676 |  |
| me-central-1 | 0.941 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.624 |  |
| us-east-1 | 0.183 | 4976 |
| us-east-2 | 0.220 | 1679 |
| us-gov-east-1 | 0.247 | 1822 |
| us-gov-west-1 | 0.190 | 218 |
| us-west-1 | 0.134 | 3927 |
| us-west-2 | 0.190 | 176 |

