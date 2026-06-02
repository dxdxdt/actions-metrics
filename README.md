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
Updated: 2026-06-02T21:43:42.082327+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.918 |  |
| ap-east-1 | 0.790 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.707 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.957 |  |
| ca-central-1 | 0.141 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.451 |  |
| eu-north-1 | 0.477 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.359 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.828 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.095 | 4713 |
| us-east-2 | 0.110 | 1621 |
| us-gov-east-1 | 0.111 | 1708 |
| us-gov-west-1 | 0.248 | 196 |
| us-west-1 | 0.234 | 3629 |
| us-west-2 | 0.278 | 162 |

