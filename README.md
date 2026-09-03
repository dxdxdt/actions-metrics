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
Updated: 2026-09-03T02:17:55.626247+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.999 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.624 |  |
| ap-northeast-3 | 0.542 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.789 |  |
| ap-southeast-2 | 0.658 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.701 |  |
| ap-southeast-5 | 0.793 |  |
| ap-southeast-6 | 0.696 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.238 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.529 |  |
| eu-north-1 | 0.572 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.556 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.472 |  |
| eu-west-3 | 0.488 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.178 | 5080 |
| us-east-2 | 0.190 | 1685 |
| us-gov-east-1 | 0.185 | 1892 |
| us-gov-west-1 | 0.183 | 230 |
| us-west-1 | 0.131 | 4077 |
| us-west-2 | 0.185 | 191 |

