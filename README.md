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
Updated: 2026-08-25T06:32:14.197528+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.505 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.531 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.759 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.819 |  |
| ap-southeast-4 | 0.731 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.212 | 18 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.515 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.530 |  |
| eu-south-2 | 0.545 |  |
| eu-west-1 | 0.427 |  |
| eu-west-2 | 0.460 |  |
| eu-west-3 | 0.489 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.173 | 5058 |
| us-east-2 | 0.176 | 1684 |
| us-gov-east-1 | 0.179 | 1882 |
| us-gov-west-1 | 0.175 | 227 |
| us-west-1 | 0.171 | 4049 |
| us-west-2 | 0.173 | 187 |

