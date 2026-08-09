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
Updated: 2026-08-09T12:33:39.519793+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.608 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.755 |  |
| ap-southeast-2 | 0.654 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.695 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.691 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.221 | 18 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.509 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.549 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.685 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.173 | 4960 |
| us-east-2 | 0.181 | 1677 |
| us-gov-east-1 | 0.162 | 1812 |
| us-gov-west-1 | 0.179 | 214 |
| us-west-1 | 0.119 | 3912 |
| us-west-2 | 0.180 | 175 |

