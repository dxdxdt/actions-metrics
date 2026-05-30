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
Updated: 2026-05-30T20:47:18.169910+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.636 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.765 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.695 |  |
| ap-southeast-5 | 0.793 |  |
| ap-southeast-6 | 0.689 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.246 | 16 |
| ca-west-1 | 0.219 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.561 |  |
| eu-south-1 | 0.555 |  |
| eu-south-2 | 0.568 |  |
| eu-west-1 | 0.447 |  |
| eu-west-2 | 0.484 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.195 | 4702 |
| us-east-2 | 0.180 | 1614 |
| us-gov-east-1 | 0.190 | 1708 |
| us-gov-west-1 | 0.180 | 195 |
| us-west-1 | 0.123 | 3623 |
| us-west-2 | 0.179 | 161 |

