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
Updated: 2026-05-29T05:08:11.165016+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.871 |  |
| ap-east-1 | 0.799 |  |
| ap-east-2 | 0.749 |  |
| ap-northeast-1 | 0.629 |  |
| ap-northeast-2 | 0.744 |  |
| ap-northeast-3 | 0.650 |  |
| ap-south-1 | 0.852 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.885 |  |
| ap-southeast-2 | 0.799 |  |
| ap-southeast-3 | 0.929 |  |
| ap-southeast-4 | 0.834 |  |
| ap-southeast-5 | 0.917 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 0.987 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.386 |  |
| eu-central-2 | 0.408 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.423 |  |
| eu-west-1 | 0.309 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.365 |  |
| il-central-1 | 0.553 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.257 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.062 | 4697 |
| us-east-2 | 0.102 | 1613 |
| us-gov-east-1 | 0.102 | 1707 |
| us-gov-west-1 | 0.310 | 195 |
| us-west-1 | 0.254 | 3614 |
| us-west-2 | 0.319 | 161 |

