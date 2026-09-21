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
Updated: 2026-09-21T11:34:52.953182+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.977 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.640 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.923 |  |
| ap-south-2 | 0.985 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.809 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.902 |  |
| ca-central-1 | 0.173 | 18 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.531 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.470 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.143 | 5111 |
| us-east-2 | 0.148 | 1686 |
| us-gov-east-1 | 0.127 | 1922 |
| us-gov-west-1 | 0.202 | 234 |
| us-west-1 | 0.146 | 4131 |
| us-west-2 | 0.207 | 192 |

