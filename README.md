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
Updated: 2026-08-22T23:13:20.201468+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.058 |  |
| ap-east-1 | 0.623 |  |
| ap-east-2 | 0.564 |  |
| ap-northeast-1 | 0.446 |  |
| ap-northeast-2 | 0.553 |  |
| ap-northeast-3 | 0.472 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.701 |  |
| ap-southeast-2 | 0.580 |  |
| ap-southeast-3 | 0.757 |  |
| ap-southeast-4 | 0.621 |  |
| ap-southeast-5 | 0.720 |  |
| ap-southeast-6 | 0.615 |  |
| ap-southeast-7 | 0.803 |  |
| ca-central-1 | 0.316 | 18 |
| ca-west-1 | 0.176 |  |
| eu-central-1 | 0.585 |  |
| eu-central-2 | 0.605 |  |
| eu-north-1 | 0.625 |  |
| eu-south-1 | 0.609 |  |
| eu-south-2 | 0.622 |  |
| eu-west-1 | 0.518 |  |
| eu-west-2 | 0.545 |  |
| eu-west-3 | 0.562 |  |
| il-central-1 | 0.744 |  |
| me-central-1 | 0.956 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.708 |  |
| us-east-1 | 0.259 | 5047 |
| us-east-2 | 0.266 | 1681 |
| us-gov-east-1 | 0.238 | 1869 |
| us-gov-west-1 | 0.107 | 225 |
| us-west-1 | 0.051 | 4029 |
| us-west-2 | 0.105 | 184 |

